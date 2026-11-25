/**
 * AudioWorklet processor for live call microphone capture (D-323 A12, B22).
 * Collects 2048 mono Float32 samples and posts them to the main thread for PCM16 encoding.
 */
class CasamaPcmProcessor extends AudioWorkletProcessor {
  constructor() {
    super();
    this._buf = new Float32Array(2048);
    this._pos = 0;
  }

  process(inputs) {
    const ch = inputs[0]?.[0];
    if (!ch) return true;
    let offset = 0;
    while (offset < ch.length) {
      const take = Math.min(ch.length - offset, this._buf.length - this._pos);
      this._buf.set(ch.subarray(offset, offset + take), this._pos);
      this._pos += take;
      offset += take;
      if (this._pos >= this._buf.length) {
        const out = this._buf;
        this._buf = new Float32Array(2048);
        this._pos = 0;
        this.port.postMessage(out, [out.buffer]);
      }
    }
    return true;
  }
}

registerProcessor("casama-pcm", CasamaPcmProcessor);
