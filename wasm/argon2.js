function isWebAssemblySupported() {
    try {
        if ((typeof WebAssembly === "object") && (typeof WebAssembly.instantiate === "function")) {
            return true;
        }
    } catch (e) {
    }
    return false;
}

async function onBodyLoad() {
    // How to test this is Firefox ?
    // "about:config" -> "javascript.options.wasm" = true/false.
    if (!isWebAssemblySupported()) {
        console.error("This browser does not support WebAssembly");
        return;
    }

    const importObject = {imports: {}};
    await WebAssembly.instantiateStreaming(fetch("argon2.wasm"), importObject).then(result => {
        window.argon2 = result;
        console.log("Argon2 WASM module has been loaded");
    })

    console.log("Test");//TODO
}
