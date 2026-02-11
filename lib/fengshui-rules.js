/**
 * Comprehensive Feng Shui Rule Library
 * Each rule has: id, category, principle, severity (1-5), recommendation
 */

export const FENG_SHUI_RULES = [
  // ═══════════════════════════════════════
  // BED PLACEMENT
  // ═══════════════════════════════════════
  {
    id: "bed_command_position",
    category: "bedroom",
    principle: "The bed must be in the Command Position — diagonally opposite the door, with a clear view of the entrance but not directly in line with it.",
    severity: 5,
    element: "bed",
    violation: "bed_not_commanding",
    recommendation: "Move the bed to the corner diagonally opposite the door so you can see anyone entering while lying down."
  },
  {
    id: "bed_door_alignment",
    category: "bedroom",
    principle: "The bed must NOT be directly aligned with the door (the 'coffin position'). Feet should not point directly at the door.",
    severity: 5,
    element: "bed",
    violation: "bed_aligned_with_door",
    recommendation: "Shift the bed off the direct line of the door. If impossible, place a footboard or trunk at the end of the bed."
  },
  {
    id: "bed_under_window",
    category: "bedroom",
    principle: "The bed should NOT be placed directly under a window — it lacks the solid backing ('mountain support') needed for restful sleep.",
    severity: 4,
    element: "bed",
    violation: "bed_under_window",
    recommendation: "Move the bed to a solid wall. If immovable, use heavy curtains and a tall, solid headboard."
  },
  {
    id: "bed_solid_headboard",
    category: "bedroom",
    principle: "The bed should have a solid headboard attached to the wall for stability and support.",
    severity: 3,
    element: "bed",
    violation: "bed_no_headboard",
    recommendation: "Add a solid wooden or upholstered headboard. Avoid metal bars or open designs."
  },
  {
    id: "mirror_facing_bed",
    category: "bedroom",
    principle: "Mirrors must NOT face the bed. They are believed to bounce energy around the room and disturb sleep.",
    severity: 5,
    element: "mirror",
    violation: "mirror_faces_bed",
    recommendation: "Relocate the mirror so it does not reflect the bed, or cover it at night."
  },
  {
    id: "bed_between_door_window",
    category: "bedroom",
    principle: "The bed should NOT be placed between the door and window, as chi rushes through this path.",
    severity: 4,
    element: "bed",
    violation: "bed_in_chi_path",
    recommendation: "Move the bed out of the direct line between the door and window."
  },
  {
    id: "bed_under_beam",
    category: "bedroom",
    principle: "The bed should NOT be placed under an exposed ceiling beam — it creates oppressive energy ('sha chi').",
    severity: 4,
    element: "bed",
    violation: "bed_under_beam",
    recommendation: "Move the bed from under the beam. If not possible, drape fabric to visually soften the beam."
  },
  {
    id: "bed_accessible_both_sides",
    category: "bedroom",
    principle: "Both sides of the bed should be accessible, ideally with matching nightstands for balance.",
    severity: 3,
    element: "bed",
    violation: "bed_one_side_blocked",
    recommendation: "Pull the bed away from the wall to allow access from both sides."
  },

  // ═══════════════════════════════════════
  // DESK / HOME OFFICE
  // ═══════════════════════════════════════
  {
    id: "desk_command_position",
    category: "office",
    principle: "The desk must be in the Command Position — facing the door with a solid wall behind you.",
    severity: 5,
    element: "desk",
    violation: "desk_not_commanding",
    recommendation: "Position the desk so you face the door with a wall at your back. Avoid placing your back to the door."
  },
  {
    id: "desk_facing_wall",
    category: "office",
    principle: "The desk should NOT face a blank wall — it blocks creative vision and opportunities.",
    severity: 3,
    element: "desk",
    violation: "desk_faces_wall",
    recommendation: "Turn the desk to face the room. If space is limited, hang an inspiring image or small mirror on the wall."
  },
  {
    id: "desk_back_to_door",
    category: "office",
    principle: "Never sit with your back to the door — it creates vulnerability and anxiety.",
    severity: 4,
    element: "desk",
    violation: "desk_back_to_door",
    recommendation: "Rotate the desk so you can see the door. Use a small mirror on your desk if the layout is fixed."
  },
  {
    id: "desk_under_beam",
    category: "office",
    principle: "The desk should NOT be under an exposed beam — it causes pressure and limits career growth.",
    severity: 3,
    element: "desk",
    violation: "desk_under_beam",
    recommendation: "Relocate the desk away from the beam."
  },

  // ═══════════════════════════════════════
  // LIVING ROOM
  // ═══════════════════════════════════════
  {
    id: "sofa_command_position",
    category: "living_room",
    principle: "The main sofa should be in the Command Position — backed by a solid wall, facing the entrance.",
    severity: 4,
    element: "sofa",
    violation: "sofa_not_commanding",
    recommendation: "Place the main sofa against a solid wall with a view of the room entrance."
  },
  {
    id: "sofa_back_to_door",
    category: "living_room",
    principle: "The main seating should NOT have its back to the entrance.",
    severity: 4,
    element: "sofa",
    violation: "sofa_back_to_door",
    recommendation: "Reorient the sofa to face or be angled toward the entrance."
  },
  {
    id: "tv_facing_window",
    category: "living_room",
    principle: "The TV should NOT face a window — glare disrupts viewing, and it creates conflicting energy flows.",
    severity: 2,
    element: "tv",
    violation: "tv_faces_window",
    recommendation: "Move the TV to a wall perpendicular to the window."
  },
  {
    id: "furniture_blocks_path",
    category: "living_room",
    principle: "Furniture should NOT block natural walking paths — chi must flow freely through the room.",
    severity: 4,
    element: "furniture",
    violation: "path_blocked",
    recommendation: "Rearrange furniture to maintain clear pathways from the door through the room."
  },
  {
    id: "sharp_corners_pointing",
    category: "living_room",
    principle: "Sharp furniture corners ('poison arrows') should NOT point at seating areas.",
    severity: 3,
    element: "furniture",
    violation: "sharp_corners_at_seating",
    recommendation: "Angle sharp-cornered furniture away from seating, or use round/soft-edged alternatives."
  },

  // ═══════════════════════════════════════
  // DOORS & WINDOWS
  // ═══════════════════════════════════════
  {
    id: "door_window_direct_line",
    category: "general",
    principle: "The main door should NOT be directly aligned with a window — chi enters and immediately escapes.",
    severity: 4,
    element: "door",
    violation: "door_window_aligned",
    recommendation: "Place a piece of furniture, plant, or screen between the door and window to slow chi flow."
  },
  {
    id: "door_blocked",
    category: "general",
    principle: "Doors must open fully without obstruction — blocked doors restrict the flow of opportunities.",
    severity: 4,
    element: "door",
    violation: "door_obstructed",
    recommendation: "Remove any items behind doors that prevent them from opening fully."
  },
  {
    id: "two_doors_clashing",
    category: "general",
    principle: "Two doors should NOT directly face each other across a hallway — it creates confrontational energy.",
    severity: 3,
    element: "door",
    violation: "doors_facing",
    recommendation: "Hang a crystal or wind chime between the doors to disperse the energy."
  },

  // ═══════════════════════════════════════
  // GENERAL / FIVE ELEMENTS
  // ═══════════════════════════════════════
  {
    id: "clutter_present",
    category: "general",
    principle: "Clutter blocks the flow of chi and creates stagnant energy. Every room must be tidy and organized.",
    severity: 5,
    element: "general",
    violation: "clutter_detected",
    recommendation: "Declutter immediately. Remove items that don't serve a purpose or bring joy."
  },
  {
    id: "lighting_balance",
    category: "general",
    principle: "Rooms should have a balance of natural and artificial lighting. Dark corners accumulate negative energy.",
    severity: 3,
    element: "general",
    violation: "poor_lighting",
    recommendation: "Add layered lighting: ambient, task, and accent. Use mirrors to reflect natural light into dark areas."
  },
  {
    id: "plants_placement",
    category: "general",
    principle: "Living plants bring positive chi (Wood element). Dead or dying plants must be removed immediately.",
    severity: 3,
    element: "plant",
    violation: "dead_plants",
    recommendation: "Replace dead plants with healthy ones. Place plants in corners to activate stagnant chi."
  },
  {
    id: "water_element_placement",
    category: "general",
    principle: "Water features (fountains, aquariums) should be in the North, East, or Southeast sectors. Never place water in the bedroom.",
    severity: 3,
    element: "water_feature",
    violation: "water_wrong_placement",
    recommendation: "Move water features to the correct sector. Remove any water elements from bedrooms."
  },
  {
    id: "color_harmony",
    category: "general",
    principle: "Colors should correspond to the Five Elements: Wood (green), Fire (red), Earth (yellow/brown), Metal (white/gold), Water (blue/black).",
    severity: 2,
    element: "general",
    violation: "color_imbalance",
    recommendation: "Introduce balancing colors through accessories, cushions, or artwork."
  },
  {
    id: "staircase_facing_door",
    category: "general",
    principle: "A staircase should NOT directly face the front door — chi rushes upstairs and bypasses the ground floor.",
    severity: 4,
    element: "staircase",
    violation: "staircase_at_door",
    recommendation: "Place a table, plant, or artwork between the staircase and door to redirect chi."
  },
  {
    id: "bathroom_door_visible",
    category: "general",
    principle: "Bathroom doors should be kept closed and not visible from the kitchen or dining area.",
    severity: 3,
    element: "door",
    violation: "bathroom_visible",
    recommendation: "Keep the bathroom door closed. Use a screen or curtain if the door is in a visible line."
  },

  // ═══════════════════════════════════════
  // KITCHEN
  // ═══════════════════════════════════════
  {
    id: "stove_command",
    category: "kitchen",
    principle: "The cook should be able to see the door while at the stove (Command Position for the kitchen).",
    severity: 4,
    element: "stove",
    violation: "stove_back_to_door",
    recommendation: "Place a small mirror behind the stove to reflect the door if relocation isn't possible."
  },
  {
    id: "stove_sink_conflict",
    category: "kitchen",
    principle: "The stove (Fire) and sink (Water) should NOT be directly opposite or adjacent — conflicting elements.",
    severity: 3,
    element: "stove",
    violation: "fire_water_conflict",
    recommendation: "Place a Wood element (cutting board, plant) between the stove and sink to mediate."
  },

  // ═══════════════════════════════════════
  // DINING ROOM
  // ═══════════════════════════════════════
  {
    id: "dining_table_shape",
    category: "dining",
    principle: "Round or oval dining tables promote equal conversation and harmonious energy.",
    severity: 2,
    element: "dining_table",
    violation: "sharp_table",
    recommendation: "Consider a round or oval table. If rectangular, soften corners with a tablecloth."
  },
  {
    id: "dining_mirror",
    category: "dining",
    principle: "A mirror reflecting the dining table doubles abundance and is highly auspicious.",
    severity: 2,
    element: "mirror",
    violation: "no_dining_mirror",
    recommendation: "Hang a mirror that reflects the dining table to symbolically double your food/wealth."
  },

  // ═══════════════════════════════════════
  // ENTRANCE / FOYER
  // ═══════════════════════════════════════
  {
    id: "entrance_clutter",
    category: "entrance",
    principle: "The entrance must be clear, well-lit, and welcoming — it is the 'mouth of chi' for the entire home.",
    severity: 5,
    element: "entrance",
    violation: "entrance_cluttered",
    recommendation: "Clear the entrance of shoes, bags, and clutter. Add good lighting and a welcoming element."
  },
  {
    id: "entrance_mirror",
    category: "entrance",
    principle: "A mirror directly facing the front door bounces chi back out of the house.",
    severity: 4,
    element: "mirror",
    violation: "mirror_at_entrance",
    recommendation: "Move the mirror to a side wall in the foyer instead of facing the door."
  },

  // ═══════════════════════════════════════
  // BATHROOM
  // ═══════════════════════════════════════
  {
    id: "toilet_lid",
    category: "bathroom",
    principle: "Toilet lids should be kept closed to prevent wealth energy from draining away.",
    severity: 3,
    element: "toilet",
    violation: "toilet_lid_open",
    recommendation: "Always close the toilet lid when not in use."
  },
  {
    id: "bathroom_above_entrance",
    category: "bathroom",
    principle: "A bathroom should NOT be located directly above the main entrance.",
    severity: 4,
    element: "bathroom",
    violation: "bathroom_over_entrance",
    recommendation: "If structural, use strong Earth elements in the bathroom (ceramics, crystals) to ground the energy."
  }
];

/**
 * Five Elements reference for the system prompt
 */
export const FIVE_ELEMENTS = {
  wood: {
    colors: ["green", "brown"],
    shapes: ["rectangular", "columnar"],
    direction: ["east", "southeast"],
    enhances: "fire",
    weakens: "earth",
    materials: ["wood", "plants", "flowers"]
  },
  fire: {
    colors: ["red", "orange", "pink", "purple"],
    shapes: ["triangular", "pointed"],
    direction: ["south"],
    enhances: "earth",
    weakens: "metal",
    materials: ["candles", "lighting", "electronics"]
  },
  earth: {
    colors: ["yellow", "beige", "terracotta"],
    shapes: ["square", "flat"],
    direction: ["center", "southwest", "northeast"],
    enhances: "metal",
    weakens: "water",
    materials: ["ceramics", "stone", "brick"]
  },
  metal: {
    colors: ["white", "gold", "silver", "gray"],
    shapes: ["round", "spherical"],
    direction: ["west", "northwest"],
    enhances: "water",
    weakens: "wood",
    materials: ["metal", "iron", "steel", "brass"]
  },
  water: {
    colors: ["blue", "black"],
    shapes: ["wavy", "irregular"],
    direction: ["north"],
    enhances: "wood",
    weakens: "fire",
    materials: ["glass", "mirrors", "water features"]
  }
};

/**
 * Get rules by category
 */
export function getRulesByCategory(category) {
  return FENG_SHUI_RULES.filter(r => r.category === category);
}

/**
 * Get rules by element
 */
export function getRulesByElement(element) {
  return FENG_SHUI_RULES.filter(r => r.element === element);
}
