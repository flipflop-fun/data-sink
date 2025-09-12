// @generated
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct Data {
    #[prost(message, repeated, tag="1")]
    pub close_token_event_list: ::prost::alloc::vec::Vec<CloseTokenEvent>,
    #[prost(message, repeated, tag="3")]
    pub initialize_token_event_list: ::prost::alloc::vec::Vec<InitializeTokenEvent>,
    #[prost(message, repeated, tag="4")]
    pub mint_event_list: ::prost::alloc::vec::Vec<MintEvent>,
    #[prost(message, repeated, tag="5")]
    pub refund_event_list: ::prost::alloc::vec::Vec<RefundEvent>,
    #[prost(message, repeated, tag="6")]
    pub set_referer_code_event_list: ::prost::alloc::vec::Vec<SetRefererCodeEvent>,
    #[prost(message, repeated, tag="8")]
    pub update_token_metadata_event_list: ::prost::alloc::vec::Vec<UpdateTokenMetadataEvent>,
    #[prost(message, repeated, tag="11")]
    pub delegate_value_manager_list: ::prost::alloc::vec::Vec<DelegateValueManager>,
    #[prost(message, repeated, tag="15")]
    pub proxy_burn_lp_tokens_list: ::prost::alloc::vec::Vec<ProxyBurnLpTokens>,
    #[prost(message, repeated, tag="16")]
    pub proxy_deposit_list: ::prost::alloc::vec::Vec<ProxyDeposit>,
    #[prost(message, repeated, tag="18")]
    pub proxy_swap_base_in_list: ::prost::alloc::vec::Vec<ProxySwapBaseIn>,
    #[prost(message, repeated, tag="19")]
    pub proxy_swap_base_out_list: ::prost::alloc::vec::Vec<ProxySwapBaseOut>,
    #[prost(message, repeated, tag="20")]
    pub proxy_withdraw_list: ::prost::alloc::vec::Vec<ProxyWithdraw>,
}
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct CloseTokenEvent {
    #[prost(string, tag="1")]
    pub tx_id: ::prost::alloc::string::String,
    #[prost(string, tag="2")]
    pub mint: ::prost::alloc::string::String,
    #[prost(string, tag="3")]
    pub config_account: ::prost::alloc::string::String,
    #[prost(string, tag="4")]
    pub token_vault: ::prost::alloc::string::String,
    #[prost(uint64, tag="5")]
    pub block_height: u64,
}
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct InitializeTokenEvent {
    #[prost(message, optional, tag="1")]
    pub metadata: ::core::option::Option<TokenMetadata>,
    #[prost(message, optional, tag="2")]
    pub init_config_data: ::core::option::Option<InitializeTokenConfigData>,
    #[prost(string, tag="3")]
    pub admin: ::prost::alloc::string::String,
    #[prost(uint64, tag="4")]
    pub token_id: u64,
    #[prost(string, tag="5")]
    pub mint: ::prost::alloc::string::String,
    #[prost(string, tag="6")]
    pub config_account: ::prost::alloc::string::String,
    #[prost(string, tag="7")]
    pub metadata_account: ::prost::alloc::string::String,
    #[prost(uint64, tag="8")]
    pub timestamp: u64,
    #[prost(string, tag="9")]
    pub token_vault: ::prost::alloc::string::String,
    #[prost(message, optional, tag="10")]
    pub mint_state_data: ::core::option::Option<TokenMintState>,
    #[prost(string, tag="11")]
    pub value_manager: ::prost::alloc::string::String,
    #[prost(string, tag="12")]
    pub wsol_vault: ::prost::alloc::string::String,
    #[prost(string, tag="13")]
    pub tx_id: ::prost::alloc::string::String,
    #[prost(uint64, tag="14")]
    pub block_height: u64,
}
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct MintEvent {
    #[prost(string, tag="1")]
    pub sender: ::prost::alloc::string::String,
    #[prost(string, tag="2")]
    pub mint: ::prost::alloc::string::String,
    #[prost(string, tag="3")]
    pub config_account: ::prost::alloc::string::String,
    #[prost(string, tag="4")]
    pub token_vault: ::prost::alloc::string::String,
    #[prost(string, tag="5")]
    pub referral_account: ::prost::alloc::string::String,
    #[prost(string, tag="6")]
    pub referrer_main: ::prost::alloc::string::String,
    #[prost(string, tag="7")]
    pub referrer_ata: ::prost::alloc::string::String,
    #[prost(string, tag="8")]
    pub refund_account: ::prost::alloc::string::String,
    #[prost(uint64, tag="9")]
    pub timestamp: u64,
    #[prost(message, optional, tag="10")]
    pub mint_state_data: ::core::option::Option<TokenMintState>,
    #[prost(uint64, tag="11")]
    pub mint_fee: u64,
    #[prost(uint64, tag="12")]
    pub referrer_fee: u64,
    #[prost(string, tag="13")]
    pub wsol_vault: ::prost::alloc::string::String,
    #[prost(string, tag="14")]
    pub tx_id: ::prost::alloc::string::String,
    #[prost(uint64, tag="15")]
    pub block_height: u64,
}
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct RefundEvent {
    #[prost(string, tag="1")]
    pub sender: ::prost::alloc::string::String,
    #[prost(string, tag="2")]
    pub mint: ::prost::alloc::string::String,
    #[prost(string, tag="3")]
    pub refund_account: ::prost::alloc::string::String,
    #[prost(string, tag="4")]
    pub config_account: ::prost::alloc::string::String,
    #[prost(string, tag="5")]
    pub token_vault: ::prost::alloc::string::String,
    #[prost(string, tag="6")]
    pub token_ata: ::prost::alloc::string::String,
    #[prost(uint64, tag="7")]
    pub timestamp: u64,
    #[prost(uint64, tag="8")]
    pub supply: u64,
    #[prost(uint64, tag="9")]
    pub total_tokens: u64,
    #[prost(uint64, tag="10")]
    pub total_mint_fee: u64,
    #[prost(uint64, tag="11")]
    pub refund_fee: u64,
    #[prost(uint64, tag="12")]
    pub refund_amount_including_fee: u64,
    #[prost(uint64, tag="13")]
    pub burn_amount_from_vault: u64,
    #[prost(uint64, tag="14")]
    pub burn_amount_from_user: u64,
    #[prost(string, tag="15")]
    pub tx_id: ::prost::alloc::string::String,
    #[prost(uint64, tag="16")]
    pub block_height: u64,
}
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct SetRefererCodeEvent {
    #[prost(string, tag="1")]
    pub mint: ::prost::alloc::string::String,
    #[prost(string, tag="2")]
    pub referral_account: ::prost::alloc::string::String,
    #[prost(string, tag="3")]
    pub referrer_ata: ::prost::alloc::string::String,
    #[prost(string, tag="4")]
    pub payer: ::prost::alloc::string::String,
    #[prost(string, tag="5")]
    pub code_hash: ::prost::alloc::string::String,
    #[prost(uint64, tag="6")]
    pub active_timestamp: u64,
    #[prost(string, tag="7")]
    pub tx_id: ::prost::alloc::string::String,
    #[prost(uint64, tag="8")]
    pub block_height: u64,
}
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct UpdateTokenMetadataEvent {
    #[prost(message, optional, tag="1")]
    pub metadata: ::core::option::Option<TokenMetadata>,
    #[prost(string, tag="2")]
    pub admin: ::prost::alloc::string::String,
    #[prost(string, tag="3")]
    pub mint: ::prost::alloc::string::String,
    #[prost(string, tag="4")]
    pub config_account: ::prost::alloc::string::String,
    #[prost(string, tag="5")]
    pub metadata_account: ::prost::alloc::string::String,
    #[prost(uint64, tag="6")]
    pub timestamp: u64,
    #[prost(string, tag="7")]
    pub tx_id: ::prost::alloc::string::String,
    #[prost(uint64, tag="8")]
    pub block_height: u64,
}
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct DelegateValueManager {
    #[prost(string, tag="1")]
    pub trx_hash: ::prost::alloc::string::String,
    #[prost(string, tag="2")]
    pub token_name: ::prost::alloc::string::String,
    #[prost(string, tag="3")]
    pub token_symbol: ::prost::alloc::string::String,
    #[prost(string, tag="4")]
    pub new_value_manager: ::prost::alloc::string::String,
    #[prost(string, tag="5")]
    pub acct_admin: ::prost::alloc::string::String,
    #[prost(string, tag="6")]
    pub acct_mint: ::prost::alloc::string::String,
    #[prost(string, tag="7")]
    pub acct_config_account: ::prost::alloc::string::String,
    #[prost(uint64, tag="8")]
    pub block_height: u64,
}
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct ProxyBurnLpTokens {
    #[prost(string, tag="1")]
    pub trx_hash: ::prost::alloc::string::String,
    #[prost(string, tag="2")]
    pub token_name: ::prost::alloc::string::String,
    #[prost(string, tag="3")]
    pub token_symbol: ::prost::alloc::string::String,
    #[prost(uint64, tag="4")]
    pub amount: u64,
    #[prost(string, tag="5")]
    pub acct_admin: ::prost::alloc::string::String,
    #[prost(string, tag="6")]
    pub acct_mint: ::prost::alloc::string::String,
    #[prost(string, tag="7")]
    pub acct_config_account: ::prost::alloc::string::String,
    #[prost(string, tag="8")]
    pub acct_owner_lp_token: ::prost::alloc::string::String,
    #[prost(string, tag="9")]
    pub acct_lp_mint: ::prost::alloc::string::String,
    #[prost(uint64, tag="10")]
    pub block_timestamp: u64,
    #[prost(uint64, tag="11")]
    pub block_height: u64,
}
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct ProxyDeposit {
    #[prost(string, tag="1")]
    pub trx_hash: ::prost::alloc::string::String,
    #[prost(string, tag="2")]
    pub token_name: ::prost::alloc::string::String,
    #[prost(string, tag="3")]
    pub token_symbol: ::prost::alloc::string::String,
    #[prost(uint64, tag="4")]
    pub lp_token_amount: u64,
    #[prost(uint64, tag="5")]
    pub maximum_token_0_amount: u64,
    #[prost(uint64, tag="6")]
    pub maximum_token_1_amount: u64,
    #[prost(string, tag="7")]
    pub acct_owner: ::prost::alloc::string::String,
    #[prost(string, tag="8")]
    pub acct_mint: ::prost::alloc::string::String,
    #[prost(string, tag="9")]
    pub acct_config_account: ::prost::alloc::string::String,
    #[prost(string, tag="10")]
    pub acct_authority: ::prost::alloc::string::String,
    #[prost(string, tag="11")]
    pub acct_pool_state: ::prost::alloc::string::String,
    #[prost(string, tag="12")]
    pub acct_owner_lp_token: ::prost::alloc::string::String,
    #[prost(string, tag="13")]
    pub acct_token_0_account: ::prost::alloc::string::String,
    #[prost(string, tag="14")]
    pub acct_token_1_account: ::prost::alloc::string::String,
    #[prost(string, tag="15")]
    pub acct_token_0_vault: ::prost::alloc::string::String,
    #[prost(string, tag="16")]
    pub acct_token_1_vault: ::prost::alloc::string::String,
    #[prost(string, tag="17")]
    pub acct_vault_0_mint: ::prost::alloc::string::String,
    #[prost(string, tag="18")]
    pub acct_vault_1_mint: ::prost::alloc::string::String,
    #[prost(string, tag="19")]
    pub acct_lp_mint: ::prost::alloc::string::String,
    #[prost(uint64, tag="20")]
    pub block_timestamp: u64,
    #[prost(uint64, tag="21")]
    pub block_height: u64,
}
/// message ProxyInitialize {
///    string trx_hash = 1;
///    string token_name = 2;
///    string token_symbol = 3;
///    uint64 init_amount_0 = 4;
///    uint64 init_amount_1 = 5;
///    uint64 open_time = 6;
///    string acct_creator = 7;
///    string acct_mint = 8;
///    string acct_config_account = 9;
///    string acct_amm_config = 10;
///    string acct_authority = 11;
///    string acct_pool_state = 12;
///    string acct_token_0_mint = 13;
///    string acct_token_1_mint = 14;
///    string acct_lp_mint = 15;
///    string acct_creator_token_0 = 16;
///    string acct_creator_token_1 = 17;
///    string acct_creator_lp_token = 18;
///    string acct_token_0_vault = 19;
///    string acct_token_1_vault = 20;
///    string acct_observation_state = 21;
///    string acct_token_0_program = 22;
///    string acct_token_1_program = 23;
///    uint64 block_timestamp = 24;
/// }
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct ProxySwapBaseIn {
    #[prost(string, tag="1")]
    pub trx_hash: ::prost::alloc::string::String,
    #[prost(string, tag="2")]
    pub token_name: ::prost::alloc::string::String,
    #[prost(string, tag="3")]
    pub token_symbol: ::prost::alloc::string::String,
    #[prost(uint64, tag="4")]
    pub amount_in: u64,
    #[prost(uint64, tag="5")]
    pub minimum_amount_out: u64,
    #[prost(string, tag="6")]
    pub acct_payer: ::prost::alloc::string::String,
    #[prost(string, tag="7")]
    pub acct_mint: ::prost::alloc::string::String,
    #[prost(string, tag="8")]
    pub acct_config_account: ::prost::alloc::string::String,
    #[prost(string, tag="9")]
    pub acct_authority: ::prost::alloc::string::String,
    #[prost(string, tag="10")]
    pub acct_amm_config: ::prost::alloc::string::String,
    #[prost(string, tag="11")]
    pub acct_pool_state: ::prost::alloc::string::String,
    #[prost(string, tag="12")]
    pub acct_input_token_account: ::prost::alloc::string::String,
    #[prost(string, tag="13")]
    pub acct_output_token_account: ::prost::alloc::string::String,
    #[prost(string, tag="14")]
    pub acct_input_vault: ::prost::alloc::string::String,
    #[prost(string, tag="15")]
    pub acct_output_vault: ::prost::alloc::string::String,
    #[prost(string, tag="16")]
    pub acct_input_token_program: ::prost::alloc::string::String,
    #[prost(string, tag="17")]
    pub acct_output_token_program: ::prost::alloc::string::String,
    #[prost(string, tag="18")]
    pub acct_input_token_mint: ::prost::alloc::string::String,
    #[prost(string, tag="19")]
    pub acct_output_token_mint: ::prost::alloc::string::String,
    #[prost(string, tag="20")]
    pub acct_observation_state: ::prost::alloc::string::String,
    #[prost(uint64, tag="21")]
    pub block_timestamp: u64,
    #[prost(uint64, tag="22")]
    pub block_height: u64,
}
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct ProxySwapBaseOut {
    #[prost(string, tag="1")]
    pub trx_hash: ::prost::alloc::string::String,
    #[prost(string, tag="2")]
    pub token_name: ::prost::alloc::string::String,
    #[prost(string, tag="3")]
    pub token_symbol: ::prost::alloc::string::String,
    #[prost(uint64, tag="4")]
    pub max_amount_in: u64,
    #[prost(uint64, tag="5")]
    pub amount_out: u64,
    #[prost(string, tag="6")]
    pub acct_payer: ::prost::alloc::string::String,
    #[prost(string, tag="7")]
    pub acct_mint: ::prost::alloc::string::String,
    #[prost(string, tag="8")]
    pub acct_config_account: ::prost::alloc::string::String,
    #[prost(string, tag="9")]
    pub acct_authority: ::prost::alloc::string::String,
    #[prost(string, tag="10")]
    pub acct_amm_config: ::prost::alloc::string::String,
    #[prost(string, tag="11")]
    pub acct_pool_state: ::prost::alloc::string::String,
    #[prost(string, tag="12")]
    pub acct_input_token_account: ::prost::alloc::string::String,
    #[prost(string, tag="13")]
    pub acct_output_token_account: ::prost::alloc::string::String,
    #[prost(string, tag="14")]
    pub acct_input_vault: ::prost::alloc::string::String,
    #[prost(string, tag="15")]
    pub acct_output_vault: ::prost::alloc::string::String,
    #[prost(string, tag="16")]
    pub acct_input_token_program: ::prost::alloc::string::String,
    #[prost(string, tag="17")]
    pub acct_output_token_program: ::prost::alloc::string::String,
    #[prost(string, tag="18")]
    pub acct_input_token_mint: ::prost::alloc::string::String,
    #[prost(string, tag="19")]
    pub acct_output_token_mint: ::prost::alloc::string::String,
    #[prost(string, tag="20")]
    pub acct_observation_state: ::prost::alloc::string::String,
    #[prost(uint64, tag="21")]
    pub block_timestamp: u64,
    #[prost(uint64, tag="22")]
    pub block_height: u64,
}
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct ProxyWithdraw {
    #[prost(string, tag="1")]
    pub trx_hash: ::prost::alloc::string::String,
    #[prost(string, tag="2")]
    pub token_name: ::prost::alloc::string::String,
    #[prost(string, tag="3")]
    pub token_symbol: ::prost::alloc::string::String,
    #[prost(uint64, tag="4")]
    pub lp_token_amount: u64,
    #[prost(uint64, tag="5")]
    pub minimum_token_0_amount: u64,
    #[prost(uint64, tag="6")]
    pub minimum_token_1_amount: u64,
    #[prost(string, tag="7")]
    pub acct_owner: ::prost::alloc::string::String,
    #[prost(string, tag="8")]
    pub acct_mint: ::prost::alloc::string::String,
    #[prost(string, tag="9")]
    pub acct_config_account: ::prost::alloc::string::String,
    #[prost(string, tag="10")]
    pub acct_authority: ::prost::alloc::string::String,
    #[prost(string, tag="11")]
    pub acct_pool_state: ::prost::alloc::string::String,
    #[prost(string, tag="12")]
    pub acct_owner_lp_token: ::prost::alloc::string::String,
    #[prost(string, tag="13")]
    pub acct_token_0_account: ::prost::alloc::string::String,
    #[prost(string, tag="14")]
    pub acct_token_1_account: ::prost::alloc::string::String,
    #[prost(string, tag="15")]
    pub acct_token_0_vault: ::prost::alloc::string::String,
    #[prost(string, tag="16")]
    pub acct_token_1_vault: ::prost::alloc::string::String,
    #[prost(string, tag="17")]
    pub acct_vault_0_mint: ::prost::alloc::string::String,
    #[prost(string, tag="18")]
    pub acct_vault_1_mint: ::prost::alloc::string::String,
    #[prost(string, tag="19")]
    pub acct_lp_mint: ::prost::alloc::string::String,
    #[prost(uint64, tag="20")]
    pub block_timestamp: u64,
    #[prost(uint64, tag="21")]
    pub block_height: u64,
}
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct TokenMintState {
    #[prost(uint64, tag="1")]
    pub supply: u64,
    #[prost(uint32, tag="2")]
    pub current_era: u32,
    #[prost(uint64, tag="3")]
    pub current_epoch: u64,
    #[prost(uint64, tag="4")]
    pub elapsed_seconds_epoch: u64,
    #[prost(uint64, tag="5")]
    pub start_timestamp_epoch: u64,
    #[prost(double, tag="6")]
    pub last_difficulty_coefficient_epoch: f64,
    #[prost(double, tag="7")]
    pub difficulty_coefficient_epoch: f64,
    #[prost(uint64, tag="8")]
    pub mint_size_epoch: u64,
    #[prost(uint64, tag="9")]
    pub quantity_minted_epoch: u64,
    #[prost(uint64, tag="10")]
    pub target_mint_size_epoch: u64,
    #[prost(uint64, tag="11")]
    pub total_mint_fee: u64,
    #[prost(uint64, tag="12")]
    pub total_referrer_fee: u64,
    #[prost(uint64, tag="13")]
    pub total_tokens: u64,
    #[prost(uint32, tag="14")]
    pub graduate_epoch: u32,
}
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct InitializeTokenConfigData {
    #[prost(uint32, tag="1")]
    pub target_eras: u32,
    #[prost(uint64, tag="2")]
    pub epoches_per_era: u64,
    #[prost(uint64, tag="3")]
    pub target_seconds_per_epoch: u64,
    #[prost(double, tag="4")]
    pub reduce_ratio: f64,
    #[prost(uint64, tag="5")]
    pub initial_mint_size: u64,
    #[prost(uint64, tag="6")]
    pub initial_target_mint_size_per_epoch: u64,
    #[prost(uint64, tag="7")]
    pub fee_rate: u64,
    #[prost(double, tag="8")]
    pub liquidity_tokens_ratio: f64,
    #[prost(uint64, tag="9")]
    pub start_timestamp: u64,
}
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct TokenMetadata {
    #[prost(string, tag="1")]
    pub symbol: ::prost::alloc::string::String,
    #[prost(string, tag="2")]
    pub name: ::prost::alloc::string::String,
    #[prost(string, tag="3")]
    pub uri: ::prost::alloc::string::String,
}
// @@protoc_insertion_point(module)
