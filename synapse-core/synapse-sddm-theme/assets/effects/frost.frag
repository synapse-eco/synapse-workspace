// Frost shader placeholder
// Replace with GLSL fragment shader for subtle sheen/frost effect.

precision mediump float;
varying vec2 vTexCoord;
uniform sampler2D uTexture;

// Generates pseudo-random noise based on pixel coordinates
float rand(vec2 co) {
    return frac(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453);
}

void main() {
    vec2 uv = vTexCoord;
    
    // Adjust these to change the frost appearance
    float grainIntensity = 0.015; 
    float blurRadius = 0.005;

    // Create a random offset for the frost grain texture
    vec2 noise = vec2(rand(uv), rand(uv + 1.0)) * grainIntensity;
    
    // Sample neighboring pixels with the added noise
    vec4 color = vec4(0.0);
    color += texture2D(uTexture, uv + noise + vec2(-blurRadius, -blurRadius));
    color += texture2D(uTexture, uv + noise + vec2(blurRadius, -blurRadius));
    color += texture2D(uTexture, uv + noise + vec2(-blurRadius, blurRadius));
    color += texture2D(uTexture, uv + noise + vec2(blurRadius, blurRadius));
    
    // Average the samples for a blurry, grainy finish
    gl_FragColor = color / 4.0;
}
