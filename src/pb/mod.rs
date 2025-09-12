// @generated
pub mod sf {
    pub mod solana {
        pub mod r#type {
            // @@protoc_insertion_point(attribute:sf.solana.type.v1)
            pub mod v1 {
                include!("sf.solana.type.v1.rs");
                // @@protoc_insertion_point(sf.solana.type.v1)
            }
        }
    }

    pub mod substreams {
        include!("sf.substreams.rs");
        pub mod solana {
            pub mod v1 {
                include!("sf.substreams.solana.v1.rs");
            }
        }
    }
}

pub mod substreams {
    pub mod v1 {
        pub mod program {
            include!("substreams.v1.program.rs");
        }
    }
}
