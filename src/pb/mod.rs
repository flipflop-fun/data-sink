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

    // 新增：暴露 sf::substreams 相关生成文件
    pub mod substreams {
        include!("sf.substreams.rs");
        pub mod solana {
            pub mod v1 {
                include!("sf.substreams.solana.v1.rs");
            }
        }
    }
}

// 新增：暴露你自定义的 substreams.v1.program 生成文件
pub mod substreams {
    pub mod v1 {
        pub mod program {
            include!("substreams.v1.program.rs");
        }
    }
}
