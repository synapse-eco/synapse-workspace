// Blur shader placeholder
// Replace with optimized blur implementation if desired.

precision mediump float;
varying vec2 vTexCoord;
uniform sampler2D uTexture;

void main() {
    vec2 uv = vTexCoord;
    vec4 color = vec4(0.0);
    float offset = 0.005; // Controls the blur intensity

    // Samples 9 neighboring pixels and averages them
    for (float x = -1.0; x <= 1.0; x++) {
        for (float y = -1.0; y <= 1.0; y++) {
            color += texture2D(uTexture, uv + vec2(x * offset, y * offset));
        }
    }
    
    gl_FragColor = color / 9.0;
}

