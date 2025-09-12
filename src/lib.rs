mod idl;
mod pb;

use anchor_lang::AnchorDeserialize;
use anchor_lang::Discriminator;
use base64::prelude::*;
use pb::substreams::v1::program::Data;
use pb::substreams::v1::program::CloseTokenEvent;
use pb::substreams::v1::program::InitializeTokenEvent;
use pb::substreams::v1::program::MintEvent;
use pb::substreams::v1::program::RefundEvent;
use pb::substreams::v1::program::SetRefererCodeEvent;
use pb::substreams::v1::program::UpdateTokenMetadataEvent;
use pb::substreams::v1::program::DelegateValueManager;
use pb::substreams::v1::program::ProxyBurnLpTokens;
use pb::substreams::v1::program::ProxyDeposit;
use pb::substreams::v1::program::ProxySwapBaseIn;
use pb::substreams::v1::program::ProxySwapBaseOut;
use pb::substreams::v1::program::ProxyWithdraw;
use pb::substreams::v1::program::InitializeTokenConfigData;
use pb::substreams::v1::program::TokenMetadata;
use pb::substreams::v1::program::TokenMintState;
use sologger_log_context::programs_selector::ProgramsSelector;
use sologger_log_context::sologger_log_context::LogContext;
use substreams_database_change::pb::database::DatabaseChanges;
use substreams_database_change::tables::Tables;
use substreams_solana::pb::sf::solana::r#type::v1::Block;
use substreams::errors::Error;

const PROGRAM_ID: &str = "FLipzZfErPUtDQPj9YrC6wp4nRRiVxRkFm3jdFmiPHJV";

#[substreams::handlers::map]
fn map_program_data(blk: Block) -> Data {
    let mut close_token_event_list: Vec<CloseTokenEvent> = Vec::new();
    let mut initialize_token_event_list: Vec<InitializeTokenEvent> = Vec::new();
    let mut mint_event_list: Vec<MintEvent> = Vec::new();
    let mut refund_event_list: Vec<RefundEvent> = Vec::new();
    let mut set_referer_code_event_list: Vec<SetRefererCodeEvent> = Vec::new();
    let mut update_token_metadata_event_list: Vec<UpdateTokenMetadataEvent> = Vec::new();
    let mut delegate_value_manager_list: Vec<DelegateValueManager> = Vec::new();
    let mut proxy_burn_lp_tokens_list: Vec<ProxyBurnLpTokens> = Vec::new();
    let mut proxy_deposit_list: Vec<ProxyDeposit> = Vec::new();
    let mut proxy_swap_base_in_list: Vec<ProxySwapBaseIn> = Vec::new();
    let mut proxy_swap_base_out_list: Vec<ProxySwapBaseOut> = Vec::new();
    let mut proxy_withdraw_list: Vec<ProxyWithdraw> = Vec::new();

    let block_time = blk.clone().block_time.unwrap().timestamp as u64;
    let block_height = blk.block_height.as_ref().map(|bh| bh.block_height).unwrap_or(blk.slot);
    blk.transactions().for_each(|transaction| {
        // ------------- EVENTS -------------
        let meta_wrapped = &transaction.meta;
        let meta = meta_wrapped.as_ref().unwrap();
        let programs_selector: ProgramsSelector = ProgramsSelector::new(&["*".to_string()]);
        let log_contexts = LogContext::parse_logs_basic(&meta.log_messages, &programs_selector);

        log_contexts
            .iter()
            .filter(|context| context.program_id == PROGRAM_ID)
            .for_each(|context| {
                context.data_logs.iter().for_each(|data| {
                    if let Ok(decoded) = BASE64_STANDARD.decode(data) {
                        let slice_u8: &mut &[u8] = &mut &decoded[..];
                        let slice_discriminator: &[u8] =
                            slice_u8[0..8].try_into().expect("error");

                        match slice_discriminator {
                            idl::idl::program::events::CloseTokenEvent::DISCRIMINATOR => {
                                if let Ok(event) =
                                    idl::idl::program::events::CloseTokenEvent::deserialize(
                                        &mut &slice_u8[8..],
                                    )
                                {
                                    close_token_event_list.push(CloseTokenEvent {
                                        tx_id: transaction.id(),
                                        block_height: block_height,
                                        mint: event.mint.to_string(),
                                        config_account: event.config_account.to_string(),
                                        token_vault: event.token_vault.to_string(),
                                    });
                                }
                            }

                            idl::idl::program::events::InitializeTokenEvent::DISCRIMINATOR => {
                                if let Ok(event) =
                                    idl::idl::program::events::InitializeTokenEvent::deserialize(
                                        &mut &slice_u8[8..],
                                    )
                                {
                                    initialize_token_event_list.push(InitializeTokenEvent {
                                        metadata: map_option_token_metadata(Some(event.metadata)),
                                        init_config_data: map_option_initialize_token_config_data(Some(event.init_config_data)),
                                        admin: event.admin.to_string(),
                                        token_id: event.token_id,
                                        mint: event.mint.to_string(),
                                        config_account: event.config_account.to_string(),
                                        metadata_account: event.metadata_account.to_string(),
                                        timestamp: event.timestamp,
                                        token_vault: event.token_vault.to_string(),
                                        mint_state_data: map_option_token_mint_state_data(Some(event.mint_state_data)),
                                        tx_id: transaction.id(),
                                        block_height: block_height,
                                        value_manager: event.value_manager.to_string(),
                                        wsol_vault: event.wsol_vault.to_string(),
                                    });
                                }
                            }
                            idl::idl::program::events::MintEvent::DISCRIMINATOR => {
                                if let Ok(event) =
                                    idl::idl::program::events::MintEvent::deserialize(
                                        &mut &slice_u8[8..],
                                    )
                                {
                                    mint_event_list.push(MintEvent {
                                        sender: event.sender.to_string(),
                                        mint: event.mint.to_string(),
                                        config_account: event.config_account.to_string(),
                                        token_vault: event.token_vault.to_string(),
                                        referral_account: event.referral_account.to_string(),
                                        referrer_main: event.referrer_main.to_string(),
                                        referrer_ata: event.referrer_ata.to_string(),
                                        refund_account: event.refund_account.to_string(),
                                        timestamp: event.timestamp,
                                        mint_state_data: map_option_token_mint_state_data(Some(event.mint_state_data)),
                                        mint_fee: event.mint_fee,
                                        referrer_fee: event.referrer_fee,
                                        wsol_vault: event.wsol_vault.to_string(),
                                        tx_id: transaction.id(),
                                        block_height: block_height,
                                    });
                                }
                            }
                            idl::idl::program::events::RefundEvent::DISCRIMINATOR => {
                                if let Ok(event) =
                                    idl::idl::program::events::RefundEvent::deserialize(
                                        &mut &slice_u8[8..],
                                    )
                                {
                                    refund_event_list.push(RefundEvent {
                                        sender: event.sender.to_string(),
                                        mint: event.mint.to_string(),
                                        refund_account: event.refund_account.to_string(),
                                        config_account: event.config_account.to_string(),
                                        token_vault: event.token_vault.to_string(),
                                        token_ata: event.token_ata.to_string(),
                                        timestamp: event.timestamp,
                                        supply: event.supply,
                                        total_tokens: event.total_tokens,
                                        total_mint_fee: event.total_mint_fee,
                                        refund_fee: event.refund_fee,
                                        refund_amount_including_fee: event.refund_amount_including_fee,
                                        burn_amount_from_vault: event.burn_amount_from_vault,
                                        burn_amount_from_user: event.burn_amount_from_user,
                                        tx_id: transaction.id(),
                                        block_height: block_height,
                                    });
                                }
                            }
                            idl::idl::program::events::SetRefererCodeEvent::DISCRIMINATOR => {
                                if let Ok(event) =
                                    idl::idl::program::events::SetRefererCodeEvent::deserialize(
                                        &mut &slice_u8[8..],
                                    )
                                {
                                    set_referer_code_event_list.push(SetRefererCodeEvent {
                                        mint: event.mint.to_string(),
                                        referral_account: event.referral_account.to_string(),
                                        referrer_ata: event.referrer_ata.to_string(),
                                        payer: event.payer.to_string(),
                                        code_hash: event.code_hash.to_string(),
                                        active_timestamp: event.active_timestamp,
                                        tx_id: transaction.id(),
                                        block_height: block_height,
                                    });
                                }
                            }

                            idl::idl::program::events::UpdateTokenMetadataEvent::DISCRIMINATOR => {
                                if let Ok(event) =
                                    idl::idl::program::events::UpdateTokenMetadataEvent::deserialize(
                                        &mut &slice_u8[8..],
                                    )
                                {
                                    update_token_metadata_event_list.push(UpdateTokenMetadataEvent {
                                        metadata: map_option_token_metadata(Some(event.metadata)),
                                        admin: event.admin.to_string(),
                                        mint: event.mint.to_string(),
                                        config_account: event.config_account.to_string(),
                                        metadata_account: event.metadata_account.to_string(),
                                        timestamp: event.timestamp,
                                        tx_id: transaction.id(),
                                        block_height: block_height,
                                    });
                                }
                            }
                            _ => {}
                        }
                    }
                });
            });// ------------- INSTRUCTIONS -------------
        transaction
        .walk_instructions()
        .into_iter()
        .filter(|inst| inst.program_id().to_string() == PROGRAM_ID)
        .for_each(|inst| {
            let slice_u8: &[u8] = &inst.data()[..];

            if slice_u8[0..8].eq(idl::idl::program::client::args::DelegateValueManager::DISCRIMINATOR) {
                if let Ok(instruction) =
                    idl::idl::program::client::args::DelegateValueManager::deserialize(&mut &slice_u8[8..])
                {
                    let accts = inst.accounts();
                    delegate_value_manager_list.push(DelegateValueManager {
                        trx_hash: transaction.id(),
                        token_name: instruction.token_name,
                        token_symbol: instruction.token_symbol,
                        new_value_manager: instruction.new_value_manager.to_string(),
                        acct_admin: accts[0].to_string(),
                        acct_mint: accts[1].to_string(),
                        acct_config_account: accts[2].to_string(),
                        block_height: block_height,
                    });
                }
            }

            if slice_u8[0..8].eq(idl::idl::program::client::args::ProxyBurnLpTokens::DISCRIMINATOR) {
                if let Ok(instruction) =
                    idl::idl::program::client::args::ProxyBurnLpTokens::deserialize(&mut &slice_u8[8..])
                {
                    let accts = inst.accounts();
                    proxy_burn_lp_tokens_list.push(ProxyBurnLpTokens {
                        trx_hash: transaction.id(),
                        token_name: instruction.token_name,
                        token_symbol: instruction.token_symbol,
                        amount: instruction.amount,
                        acct_admin: accts[0].to_string(),
                        acct_mint: accts[1].to_string(),
                        acct_config_account: accts[2].to_string(),
                        acct_owner_lp_token: accts[3].to_string(),
                        acct_lp_mint: accts[4].to_string(),
                        block_timestamp: block_time,
                        block_height: block_height,
                    });
                }
            }
            
            if slice_u8[0..8].eq(idl::idl::program::client::args::ProxyDeposit::DISCRIMINATOR) {
                if let Ok(instruction) =
                    idl::idl::program::client::args::ProxyDeposit::deserialize(&mut &slice_u8[8..])
                {
                    let accts = inst.accounts();
                    proxy_deposit_list.push(ProxyDeposit {
                        trx_hash: transaction.id(),
                        token_name: instruction.token_name,
                        token_symbol: instruction.token_symbol,
                        lp_token_amount: instruction.lp_token_amount,
                        maximum_token_0_amount: instruction.maximum_token_0_amount,
                        maximum_token_1_amount: instruction.maximum_token_1_amount,
                        acct_owner: accts[1].to_string(),
                        acct_mint: accts[2].to_string(),
                        acct_config_account: accts[3].to_string(),
                        acct_authority: accts[4].to_string(),
                        acct_pool_state: accts[5].to_string(),
                        acct_owner_lp_token: accts[6].to_string(),
                        acct_token_0_account: accts[7].to_string(),
                        acct_token_1_account: accts[8].to_string(),
                        acct_token_0_vault: accts[9].to_string(),
                        acct_token_1_vault: accts[10].to_string(),
                        acct_vault_0_mint: accts[13].to_string(),
                        acct_vault_1_mint: accts[14].to_string(),
                        acct_lp_mint: accts[15].to_string(),
                        block_timestamp: block_time,
                        block_height: block_height,
                    });
                }
            }
            
            if slice_u8[0..8].eq(idl::idl::program::client::args::ProxySwapBaseIn::DISCRIMINATOR) {
                if let Ok(instruction) =
                    idl::idl::program::client::args::ProxySwapBaseIn::deserialize(&mut &slice_u8[8..])
                {
                    let accts = inst.accounts();
                    proxy_swap_base_in_list.push(ProxySwapBaseIn {
                        trx_hash: transaction.id(),
                        token_name: instruction.token_name,
                        token_symbol: instruction.token_symbol,
                        amount_in: instruction.amount_in,
                        minimum_amount_out: instruction.minimum_amount_out,
                        acct_payer: accts[1].to_string(),
                        acct_mint: accts[2].to_string(),
                        acct_config_account: accts[3].to_string(),
                        acct_authority: accts[4].to_string(),
                        acct_amm_config: accts[5].to_string(),
                        acct_pool_state: accts[6].to_string(),
                        acct_input_token_account: accts[7].to_string(),
                        acct_output_token_account: accts[8].to_string(),
                        acct_input_vault: accts[9].to_string(),
                        acct_output_vault: accts[10].to_string(),
                        acct_input_token_program: accts[11].to_string(),
                        acct_output_token_program: accts[12].to_string(),
                        acct_input_token_mint: accts[13].to_string(),
                        acct_output_token_mint: accts[14].to_string(),
                        acct_observation_state: accts[15].to_string(),
                        block_timestamp: block_time,
                        block_height: block_height,
                    });
                }
            }
            
            if slice_u8[0..8].eq(idl::idl::program::client::args::ProxySwapBaseOut::DISCRIMINATOR) {
                if let Ok(instruction) =
                    idl::idl::program::client::args::ProxySwapBaseOut::deserialize(&mut &slice_u8[8..])
                {
                    let accts = inst.accounts();
                    proxy_swap_base_out_list.push(ProxySwapBaseOut {
                        trx_hash: transaction.id(),
                        token_name: instruction.token_name,
                        token_symbol: instruction.token_symbol,
                        max_amount_in: instruction.max_amount_in,
                        amount_out: instruction.amount_out,
                        acct_payer: accts[1].to_string(),
                        acct_mint: accts[2].to_string(),
                        acct_config_account: accts[3].to_string(),
                        acct_authority: accts[4].to_string(),
                        acct_amm_config: accts[5].to_string(),
                        acct_pool_state: accts[6].to_string(),
                        acct_input_token_account: accts[7].to_string(),
                        acct_output_token_account: accts[8].to_string(),
                        acct_input_vault: accts[9].to_string(),
                        acct_output_vault: accts[10].to_string(),
                        acct_input_token_program: accts[11].to_string(),
                        acct_output_token_program: accts[12].to_string(),
                        acct_input_token_mint: accts[13].to_string(),
                        acct_output_token_mint: accts[14].to_string(),
                        acct_observation_state: accts[15].to_string(),
                        block_timestamp: block_time,
                        block_height: block_height,
                    });
                }
            }
            
            if slice_u8[0..8].eq(idl::idl::program::client::args::ProxyWithdraw::DISCRIMINATOR) {
                if let Ok(instruction) =
                    idl::idl::program::client::args::ProxyWithdraw::deserialize(&mut &slice_u8[8..])
                {
                    let accts = inst.accounts();
                    proxy_withdraw_list.push(ProxyWithdraw {
                        trx_hash: transaction.id(),
                        token_name: instruction.token_name,
                        token_symbol: instruction.token_symbol,
                        lp_token_amount: instruction.lp_token_amount,
                        minimum_token_0_amount: instruction.minimum_token_0_amount,
                        minimum_token_1_amount: instruction.minimum_token_1_amount,
                        acct_owner: accts[1].to_string(),
                        acct_mint: accts[2].to_string(),
                        acct_config_account: accts[3].to_string(),
                        acct_authority: accts[4].to_string(),
                        acct_pool_state: accts[5].to_string(),
                        acct_owner_lp_token: accts[6].to_string(),
                        acct_token_0_account: accts[7].to_string(),
                        acct_token_1_account: accts[8].to_string(),
                        acct_token_0_vault: accts[9].to_string(),
                        acct_token_1_vault: accts[10].to_string(),
                        acct_vault_0_mint: accts[13].to_string(),
                        acct_vault_1_mint: accts[14].to_string(),
                        acct_lp_mint: accts[15].to_string(),
                        block_timestamp: block_time,
                        block_height: block_height,
                    });
                }
            }
        });
    });


    Data {
        close_token_event_list,
        initialize_token_event_list,
        mint_event_list,
        refund_event_list,
        set_referer_code_event_list,
        update_token_metadata_event_list,
        delegate_value_manager_list,
        proxy_burn_lp_tokens_list,
        proxy_deposit_list,
        proxy_swap_base_in_list,
        proxy_swap_base_out_list,
        proxy_withdraw_list,
    }
}

fn map_option_initialize_token_config_data(value: Option<idl::idl::program::types::InitializeTokenConfigData>) -> Option<InitializeTokenConfigData> {
    match value {
        Some(initialize_token_config_data) => {
            return Some(InitializeTokenConfigData {
                target_eras: initialize_token_config_data.target_eras,
                epoches_per_era: initialize_token_config_data.epoches_per_era,
                target_seconds_per_epoch: initialize_token_config_data.target_seconds_per_epoch,
                reduce_ratio: initialize_token_config_data.reduce_ratio,
                initial_mint_size: initialize_token_config_data.initial_mint_size,
                initial_target_mint_size_per_epoch: initialize_token_config_data.initial_target_mint_size_per_epoch,
                fee_rate: initialize_token_config_data.fee_rate,
                liquidity_tokens_ratio: initialize_token_config_data.liquidity_tokens_ratio,
                start_timestamp: initialize_token_config_data.start_timestamp,
            })
        },
        None => {
            return None;
        }
    }
}

fn map_option_token_metadata(value: Option<idl::idl::program::types::TokenMetadata>) -> Option<TokenMetadata> {
    match value {
        Some(token_metadata) => {
            return Some(TokenMetadata {
                symbol: token_metadata.symbol,
                name: token_metadata.name,
                uri: token_metadata.uri,
            })
        },
        None => {
            return None;
        }
    }
}

fn map_option_token_mint_state_data(value: Option<idl::idl::program::types::TokenMintState>) -> Option<TokenMintState> {
    match value {
        Some(token_mint_state_data) => {
            return Some(TokenMintState {
                supply: token_mint_state_data.supply,
                current_era: token_mint_state_data.current_era,
                current_epoch: token_mint_state_data.current_epoch,
                elapsed_seconds_epoch: token_mint_state_data.elapsed_seconds_epoch,
                start_timestamp_epoch: token_mint_state_data.start_timestamp_epoch,
                last_difficulty_coefficient_epoch: token_mint_state_data.last_difficulty_coefficient_epoch,
                difficulty_coefficient_epoch: token_mint_state_data.difficulty_coefficient_epoch,
                mint_size_epoch: token_mint_state_data.mint_size_epoch,
                quantity_minted_epoch: token_mint_state_data.quantity_minted_epoch,
                target_mint_size_epoch: token_mint_state_data.target_mint_size_epoch,
                total_mint_fee: token_mint_state_data.total_mint_fee,
                total_referrer_fee: token_mint_state_data.total_referrer_fee,
                total_tokens: token_mint_state_data.total_tokens,
                graduate_epoch: token_mint_state_data.graduate_epoch,
            })
        },
        None => {
            return None;
        }
    }
}

#[substreams::handlers::map]
fn db_out(data: Data) -> Result<DatabaseChanges, Error> {
    let mut tables = Tables::new();

    for e in data.initialize_token_event_list {
        let id = e.mint.to_lowercase();
        let row = tables.upsert_row("initialize_token_event_entity", id.clone());
        row.set("id", &id)
            .set("tx_id", &e.tx_id)
            .set("block_height", e.block_height)
            .set("admin", &e.admin)
            .set("token_id", e.token_id)
            .set("mint", &e.mint)
            .set("config_account", &e.config_account)
            .set("metadata_account", &e.metadata_account)
            .set("timestamp", e.timestamp)
            .set("token_vault", &e.token_vault)
            .set("value_manager", &e.value_manager)
            .set("wsol_vault", &e.wsol_vault)
            .set("status", 1i32)
            .set("metadata_timestamp", e.timestamp as i64);

        if let Some(meta) = e.metadata {
            row.set("token_name", meta.name)
               .set("token_symbol", meta.symbol)
               .set("token_uri", meta.uri);
        }
        if let Some(cfg) = e.init_config_data {
            row.set("target_eras", cfg.target_eras)
               .set("epoches_per_era", cfg.epoches_per_era)
               .set("target_seconds_per_epoch", cfg.target_seconds_per_epoch)
               .set("reduce_ratio", cfg.reduce_ratio.to_string())
               .set("initial_mint_size", cfg.initial_mint_size)
               .set("initial_target_mint_size_per_epoch", cfg.initial_target_mint_size_per_epoch)
               .set("fee_rate", cfg.fee_rate)
               .set("liquidity_tokens_ratio", cfg.liquidity_tokens_ratio.to_string())
               .set("start_timestamp", cfg.start_timestamp);
        }
        if let Some(ms) = e.mint_state_data {
            row.set("supply", ms.supply)
               .set("current_era", ms.current_era as u64)
               .set("current_epoch", ms.current_epoch)
               .set("elapsed_seconds_epoch", ms.elapsed_seconds_epoch)
               .set("start_timestamp_epoch", ms.start_timestamp_epoch)
               .set("last_difficulty_coefficient_epoch", ms.last_difficulty_coefficient_epoch.to_string())
               .set("difficulty_coefficient_epoch", ms.difficulty_coefficient_epoch.to_string())
               .set("mint_size_epoch", ms.mint_size_epoch)
               .set("quantity_minted_epoch", ms.quantity_minted_epoch)
               .set("target_mint_size_epoch", ms.target_mint_size_epoch)
               .set("total_mint_fee", ms.total_mint_fee)
               .set("total_referrer_fee", ms.total_referrer_fee)
               .set("total_tokens", ms.total_tokens)
               .set("graduate_epoch", ms.graduate_epoch as u64);
        }
    }

    for e in data.mint_event_list {
        let id = format!("{}_{}_mint_{}", e.mint, e.sender, e.tx_id).to_lowercase();
        let row = tables.create_row("mint_token_entity", id.clone());
        row.set("id", &id)
           .set("tx_id", &e.tx_id)
           .set("block_height", e.block_height)
           .set("sender", &e.sender)
           .set("mint", &e.mint)
           .set("config_account", &e.config_account)
           .set("token_vault", &e.token_vault)
           .set("referral_account", &e.referral_account)
           .set("referrer_main", &e.referrer_main)
           .set("referrer_ata", &e.referrer_ata)
           .set("refund_account", &e.refund_account)
           .set("timestamp", e.timestamp)
           .set("mint_fee", e.mint_fee)
           .set("referrer_fee", e.referrer_fee)
           .set("wsol_vault", &e.wsol_vault);

        if let Some(ms) = e.mint_state_data.clone() {
            row.set("supply", ms.supply)
               .set("current_era", ms.current_era)
               .set("current_epoch", ms.current_epoch)
               .set("elapsed_seconds_epoch", ms.elapsed_seconds_epoch)
               .set("start_timestamp_epoch", ms.start_timestamp_epoch)
               .set("last_difficulty_coefficient_epoch", ms.last_difficulty_coefficient_epoch.to_string())
               .set("difficulty_coefficient_epoch", ms.difficulty_coefficient_epoch.to_string())
               .set("mint_size_epoch", ms.mint_size_epoch)
               .set("quantity_minted_epoch", ms.quantity_minted_epoch)
               .set("target_mint_size_epoch", ms.target_mint_size_epoch)
               .set("total_mint_fee", ms.total_mint_fee)
               .set("total_referrer_fee", ms.total_referrer_fee)
               .set("total_tokens", ms.total_tokens)
               .set("graduate_epoch", ms.graduate_epoch);

            let init_row = tables.update_row("initialize_token_event_entity", e.mint.to_lowercase());
            init_row.set("supply", ms.supply)
                .set("current_era", ms.current_era)
                .set("current_epoch", ms.current_epoch)
                .set("elapsed_seconds_epoch", ms.elapsed_seconds_epoch)
                .set("start_timestamp_epoch", ms.start_timestamp_epoch)
                .set("last_difficulty_coefficient_epoch", ms.last_difficulty_coefficient_epoch.to_string())
                .set("difficulty_coefficient_epoch", ms.difficulty_coefficient_epoch.to_string())
                .set("mint_size_epoch", ms.mint_size_epoch)
                .set("quantity_minted_epoch", ms.quantity_minted_epoch)
                .set("target_mint_size_epoch", ms.target_mint_size_epoch)
                .set("total_mint_fee", ms.total_mint_fee)
                .set("total_referrer_fee", ms.total_referrer_fee)
                .set("total_tokens", ms.total_tokens)
                .set("graduate_epoch", ms.graduate_epoch);
        }

        // Add mint size to Holders entity (accumulative via DB upsert expression)
        if let Some(ms) = e.mint_state_data.clone() {
            let holders_id = format!("{}_{}", e.mint, e.sender).to_lowercase();
            let row = tables.upsert_row("holders_entity", holders_id.clone());
            row.set("id", &holders_id)
               .set("mint", &e.mint)
               .set("owner", &e.sender)
               .set("amount", ms.mint_size_epoch as i64);
        }
    }

    for e in data.set_referer_code_event_list {
        let id = e.code_hash.to_lowercase();
        let row = tables.upsert_row("set_referer_code_event_entity", id.clone());
        row.set("id", &id)
           .set("block_height", e.block_height)
           .set("tx_id", &e.tx_id)
           .set("mint", &e.mint)
           .set("referral_account", &e.referral_account)
           .set("referrer_ata", &e.referrer_ata)
           .set("referrer_main", &e.payer)
           .set("active_timestamp", e.active_timestamp);
    }

    for e in data.update_token_metadata_event_list {
        let id = format!("{}_update_{}", e.mint, e.metadata_account).to_lowercase();
        let row = tables.upsert_row("update_token_metadata_event_entity", id.clone());
        row.set("id", &id)
           .set("block_height", e.block_height)
           .set("tx_id", &e.tx_id)
           .set("admin", &e.admin)
           .set("mint", &e.mint)
           .set("config_account", &e.config_account)
           .set("metadata_account", &e.metadata_account)
           .set("timestamp", e.timestamp);
        if let Some(meta) = e.metadata {
            let uri = meta.uri.trim_matches(|c: char| c == '`' || c.is_whitespace()).to_string();
            row.set("token_name", meta.name)
               .set("token_symbol", meta.symbol)
               .set("token_uri", uri.clone());

            let init_row = tables.update_row("initialize_token_event_entity", e.mint.to_lowercase());
            init_row.set("token_uri", uri)
                    .set("metadata_timestamp", e.timestamp);
        }
    }

    for e in data.close_token_event_list {
        let id = format!("{}_close_{}", e.mint, e.tx_id).to_lowercase();
        let row = tables.create_row("close_token_event_entity", id.clone());
        row.set("id", &id)
           .set("tx_id", &e.tx_id)
           .set("block_height", e.block_height)
           .set("mint", &e.mint)
           .set("config_account", &e.config_account)
           .set("token_vault", &e.token_vault);

        let init_row = tables.update_row("initialize_token_event_entity", e.mint.to_lowercase());
        init_row.set("status", 2i32); // Set to close
    }

    for e in data.refund_event_list {
        let id = format!("{}_{}_refund_{}", e.mint, e.sender, e.tx_id).to_lowercase();
        let row = tables.create_row("refund_event_entity", id.clone());
        row.set("id", &id)
           .set("tx_id", &e.tx_id)
           .set("block_height", e.block_height)
           .set("sender", &e.sender)
           .set("mint", &e.mint)
           .set("refund_account", &e.refund_account)
           .set("config_account", &e.config_account)
           .set("token_vault", &e.token_vault)
           .set("token_ata", &e.token_ata)
           .set("timestamp", e.timestamp)
           .set("supply", e.supply)
           .set("total_tokens", e.total_tokens)
           .set("total_mint_fee", e.total_mint_fee)
           .set("refund_fee", e.refund_fee)
           .set("refund_amount_including_fee", e.refund_amount_including_fee)
           .set("burn_amount_from_vault", e.burn_amount_from_vault)
           .set("burn_amount_from_user", e.burn_amount_from_user);

        let init_row = tables.update_row("initialize_token_event_entity", e.mint.to_lowercase());
        init_row.set("supply", e.supply)
                .set("total_mint_fee", e.total_mint_fee)
                .set("total_tokens", e.total_tokens);

        // remove the refund amount from the holder (accumulative via DB upsert expression)
        let holders_id = format!("{}_{}", e.mint, e.sender).to_lowercase();
        let row = tables.upsert_row("holders_entity", holders_id.clone());
        row.set("id", &holders_id)
           .set("mint", &e.mint)
           .set("owner", &e.sender)
           .set("amount", -(e.burn_amount_from_user as i64));
    }

    for e in data.delegate_value_manager_list {
        let init_row = tables.update_row("initialize_token_event_entity", e.acct_mint.to_lowercase());
        init_row.set("value_manager", e.new_value_manager);
    }

    for e in data.proxy_deposit_list {
        let id = format!("{}_proxy_deposit_{}", e.acct_mint, e.trx_hash).to_lowercase();
        let row = tables.create_row("proxy_liquidity_event_entity", id.clone());
        row.set("id", &id)
           .set("tx_id", &e.trx_hash)
           .set("block_height", e.block_height)
           .set("token_mint", &e.acct_mint)
           .set("token_name", &e.token_name)
           .set("token_symbol", &e.token_symbol)
           .set("action", "deposit")
           .set("token_0_mint", &e.acct_vault_0_mint)
           .set("token_1_mint", &e.acct_vault_1_mint)
           .set("token_0_amount", e.maximum_token_0_amount)
           .set("token_1_amount", e.maximum_token_1_amount)
           .set("pool_state", &e.acct_pool_state)
           .set("lp_mint", &e.acct_lp_mint)
           .set("lp_amount", e.lp_token_amount)
           .set("block_timestamp", e.block_timestamp);
    }

    for e in data.proxy_withdraw_list {
        let id = format!("{}_proxy_withdraw_{}", e.acct_mint, e.trx_hash).to_lowercase();
        let row = tables.create_row("proxy_liquidity_event_entity", id.clone());
        row.set("id", &id)
           .set("tx_id", &e.trx_hash)
           .set("block_height", e.block_height)
           .set("token_mint", &e.acct_mint)
           .set("token_name", &e.token_name)
           .set("token_symbol", &e.token_symbol)
           .set("action", "withdraw")
           .set("token_0_mint", &e.acct_vault_0_mint)
           .set("token_1_mint", &e.acct_vault_1_mint)
           .set("token_0_amount", e.minimum_token_0_amount)
           .set("token_1_amount", e.minimum_token_1_amount)
           .set("pool_state", &e.acct_pool_state)
           .set("lp_mint", &e.acct_lp_mint)
           .set("lp_amount", e.lp_token_amount)
           .set("block_timestamp", e.block_timestamp);
    }

    for e in data.proxy_swap_base_in_list {
        let id = format!("{}_proxy_swap_in_{}", e.acct_mint, e.trx_hash).to_lowercase();
        let row = tables.create_row("proxy_swap_base_event_entity", id.clone());
        row.set("id", &id)
           .set("tx_id", &e.trx_hash)
           .set("block_height", e.block_height)
           .set("token_mint", &e.acct_mint)
           .set("token_name", &e.token_name)
           .set("token_symbol", &e.token_symbol)
           .set("action", "in")
           .set("base_mint", &e.acct_input_token_mint)
           .set("price_mint", &e.acct_output_token_mint)
           .set("base_amount", e.amount_in)
           .set("price_amount", e.minimum_amount_out)
           .set("pool_state", &e.acct_pool_state)
           .set("block_timestamp", e.block_timestamp);
    }

    for e in data.proxy_swap_base_out_list {
        let id = format!("{}_proxy_swap_out_{}", e.acct_mint, e.trx_hash).to_lowercase();
        let row = tables.create_row("proxy_swap_base_event_entity", id.clone());
        row.set("id", &id)
           .set("tx_id", &e.trx_hash)
           .set("block_height", e.block_height)
           .set("token_mint", &e.acct_mint)
           .set("token_name", &e.token_name)
           .set("token_symbol", &e.token_symbol)
           .set("action", "out")
           .set("base_mint", &e.acct_output_token_mint)
           .set("price_mint", &e.acct_input_token_mint)
           .set("base_amount", e.amount_out)
           .set("price_amount", e.max_amount_in)
           .set("pool_state", &e.acct_pool_state)
           .set("block_timestamp", e.block_timestamp);
    }

    for e in data.proxy_burn_lp_tokens_list {
        let id = format!("{}_proxy_burn_{}", e.acct_mint, e.trx_hash).to_lowercase();
        let row = tables.create_row("proxy_burn_lp_tokens_event_entity", id.clone());
        row.set("id", &id)
           .set("tx_id", &e.trx_hash)
           .set("block_height", e.block_height)
           .set("token_mint", &e.acct_mint)
           .set("token_name", &e.token_name)
           .set("token_symbol", &e.token_symbol)
           .set("lp_mint", &e.acct_lp_mint)
           .set("lp_amount", e.amount)
           .set("block_timestamp", e.block_timestamp);
    }

    Ok(tables.to_database_changes())
}