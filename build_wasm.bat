emcmake cmake . -B "_BUILD_" -G "MinGW Makefiles"
emmake cmake --build _BUILD_
cd _BUILD_

emcc libargon2.a -O3 -o argon2.js --no-entry -s EXPORTED_FUNCTIONS=["_argon2_ctx","_argon2_encodedlen","_argon2_error_message","_argon2_hash","_argon2_type2string","_argon2_verify","_argon2_verify_ctx","_argon2d_ctx","_argon2d_hash_encoded","_argon2d_hash_raw","_argon2d_verify","_argon2d_verify_ctx","_argon2i_ctx","_argon2i_hash_encoded","_argon2i_hash_raw","_argon2i_verify","_argon2i_verify_ctx","_argon2id_ctx","_argon2id_hash_encoded","_argon2id_hash_raw","_argon2id_verify","_argon2id_verify_ctx","_malloc","_free","getValue","setValue"] -s EXPORTED_RUNTIME_METHODS=["ccall","cwrap"]
