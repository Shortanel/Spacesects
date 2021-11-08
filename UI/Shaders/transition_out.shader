shader_type canvas_item;

uniform float progress : hint_range(0.0, 0.5);
uniform float diamondPixelSize = 20f;

void fragment() {
    float xFraction = fract(FRAGCOORD.x / diamondPixelSize);
    float yFraction = fract(FRAGCOORD.y / diamondPixelSize);
	
	float xDistance = abs(xFraction - 0.5);
    float yDistance = abs(yFraction - 0.5);
    
    // We need to fill in this logic.
    if (xDistance + yDistance + UV.x   < progress * 4f) {

        discard;
    }
}