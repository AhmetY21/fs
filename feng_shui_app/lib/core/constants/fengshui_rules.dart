class FengShuiRule {
  const FengShuiRule({
    required this.id,
    required this.category,
    required this.principle,
    required this.severity,
    required this.element,
    required this.violation,
    required this.recommendation,
  });

  final String id;
  final String category;
  final String principle;
  final int severity;
  final String element;
  final String violation;
  final String recommendation;
}

class FiveElement {
  const FiveElement({
    required this.name,
    required this.colors,
    required this.shapes,
    required this.direction,
    required this.enhances,
    required this.weakens,
    required this.materials,
  });

  final String name;
  final List<String> colors;
  final List<String> shapes;
  final List<String> direction;
  final String enhances;
  final String weakens;
  final List<String> materials;
}

abstract final class FengShuiData {
  static const rules = <FengShuiRule>[
    FengShuiRule(id: 'bed_command_position', category: 'bedroom', principle: 'The bed must be in the Command Position — diagonally opposite the door.', severity: 5, element: 'bed', violation: 'bed_not_commanding', recommendation: 'Move the bed to the corner diagonally opposite the door.'),
    FengShuiRule(id: 'bed_door_alignment', category: 'bedroom', principle: 'The bed must NOT be directly aligned with the door (coffin position).', severity: 5, element: 'bed', violation: 'bed_aligned_with_door', recommendation: 'Shift the bed off the direct line of the door.'),
    FengShuiRule(id: 'bed_under_window', category: 'bedroom', principle: 'The bed should NOT be placed directly under a window.', severity: 4, element: 'bed', violation: 'bed_under_window', recommendation: 'Move the bed to a solid wall. Use heavy curtains if immovable.'),
    FengShuiRule(id: 'bed_solid_headboard', category: 'bedroom', principle: 'The bed should have a solid headboard attached to the wall.', severity: 3, element: 'bed', violation: 'bed_no_headboard', recommendation: 'Add a solid wooden or upholstered headboard.'),
    FengShuiRule(id: 'mirror_facing_bed', category: 'bedroom', principle: 'Mirrors must NOT face the bed.', severity: 5, element: 'mirror', violation: 'mirror_faces_bed', recommendation: 'Relocate the mirror so it does not reflect the bed.'),
    FengShuiRule(id: 'bed_between_door_window', category: 'bedroom', principle: 'The bed should NOT be between the door and window.', severity: 4, element: 'bed', violation: 'bed_in_chi_path', recommendation: 'Move the bed out of the direct line between door and window.'),
    FengShuiRule(id: 'bed_under_beam', category: 'bedroom', principle: 'The bed should NOT be under an exposed ceiling beam.', severity: 4, element: 'bed', violation: 'bed_under_beam', recommendation: 'Move the bed from under the beam or drape fabric to soften it.'),
    FengShuiRule(id: 'bed_accessible_both_sides', category: 'bedroom', principle: 'Both sides of the bed should be accessible.', severity: 3, element: 'bed', violation: 'bed_one_side_blocked', recommendation: 'Pull the bed away from the wall to allow access from both sides.'),
    FengShuiRule(id: 'desk_command_position', category: 'office', principle: 'The desk must be in the Command Position — facing the door.', severity: 5, element: 'desk', violation: 'desk_not_commanding', recommendation: 'Position the desk so you face the door with a wall at your back.'),
    FengShuiRule(id: 'desk_facing_wall', category: 'office', principle: 'The desk should NOT face a blank wall.', severity: 3, element: 'desk', violation: 'desk_faces_wall', recommendation: 'Turn the desk to face the room or hang an inspiring image.'),
    FengShuiRule(id: 'desk_back_to_door', category: 'office', principle: 'Never sit with your back to the door.', severity: 4, element: 'desk', violation: 'desk_back_to_door', recommendation: 'Rotate the desk so you can see the door.'),
    FengShuiRule(id: 'desk_under_beam', category: 'office', principle: 'The desk should NOT be under an exposed beam.', severity: 3, element: 'desk', violation: 'desk_under_beam', recommendation: 'Relocate the desk away from the beam.'),
    FengShuiRule(id: 'sofa_command_position', category: 'living_room', principle: 'The main sofa should be in the Command Position.', severity: 4, element: 'sofa', violation: 'sofa_not_commanding', recommendation: 'Place the main sofa against a solid wall with a view of the entrance.'),
    FengShuiRule(id: 'sofa_back_to_door', category: 'living_room', principle: 'The main seating should NOT have its back to the entrance.', severity: 4, element: 'sofa', violation: 'sofa_back_to_door', recommendation: 'Reorient the sofa to face or angle toward the entrance.'),
    FengShuiRule(id: 'tv_facing_window', category: 'living_room', principle: 'The TV should NOT face a window.', severity: 2, element: 'tv', violation: 'tv_faces_window', recommendation: 'Move the TV to a wall perpendicular to the window.'),
    FengShuiRule(id: 'furniture_blocks_path', category: 'living_room', principle: 'Furniture should NOT block natural walking paths.', severity: 4, element: 'furniture', violation: 'path_blocked', recommendation: 'Rearrange furniture to maintain clear pathways.'),
    FengShuiRule(id: 'sharp_corners_pointing', category: 'living_room', principle: 'Sharp furniture corners should NOT point at seating areas.', severity: 3, element: 'furniture', violation: 'sharp_corners_at_seating', recommendation: 'Angle sharp-cornered furniture away from seating.'),
    FengShuiRule(id: 'door_window_direct_line', category: 'general', principle: 'The main door should NOT be directly aligned with a window.', severity: 4, element: 'door', violation: 'door_window_aligned', recommendation: 'Place furniture or a screen between the door and window.'),
    FengShuiRule(id: 'door_blocked', category: 'general', principle: 'Doors must open fully without obstruction.', severity: 4, element: 'door', violation: 'door_obstructed', recommendation: 'Remove any items that prevent doors from opening fully.'),
    FengShuiRule(id: 'two_doors_clashing', category: 'general', principle: 'Two doors should NOT directly face each other.', severity: 3, element: 'door', violation: 'doors_facing', recommendation: 'Hang a crystal or wind chime between the doors.'),
    FengShuiRule(id: 'clutter_present', category: 'general', principle: 'Clutter blocks the flow of chi. Rooms must be tidy.', severity: 5, element: 'general', violation: 'clutter_detected', recommendation: 'Declutter immediately. Remove items that don\'t serve a purpose.'),
    FengShuiRule(id: 'lighting_balance', category: 'general', principle: 'Rooms should have a balance of natural and artificial lighting.', severity: 3, element: 'general', violation: 'poor_lighting', recommendation: 'Add layered lighting and use mirrors to reflect natural light.'),
    FengShuiRule(id: 'plants_placement', category: 'general', principle: 'Living plants bring positive chi. Dead plants must be removed.', severity: 3, element: 'plant', violation: 'dead_plants', recommendation: 'Replace dead plants with healthy ones.'),
    FengShuiRule(id: 'water_element_placement', category: 'general', principle: 'Water features should be in the North, East, or Southeast.', severity: 3, element: 'water_feature', violation: 'water_wrong_placement', recommendation: 'Move water features to the correct sector.'),
    FengShuiRule(id: 'color_harmony', category: 'general', principle: 'Colors should correspond to the Five Elements.', severity: 2, element: 'general', violation: 'color_imbalance', recommendation: 'Introduce balancing colors through accessories.'),
    FengShuiRule(id: 'staircase_facing_door', category: 'general', principle: 'A staircase should NOT directly face the front door.', severity: 4, element: 'staircase', violation: 'staircase_at_door', recommendation: 'Place a table or plant between the staircase and door.'),
    FengShuiRule(id: 'bathroom_door_visible', category: 'general', principle: 'Bathroom doors should be kept closed and not visible from kitchen/dining.', severity: 3, element: 'door', violation: 'bathroom_visible', recommendation: 'Keep the bathroom door closed. Use a screen if needed.'),
    FengShuiRule(id: 'stove_command', category: 'kitchen', principle: 'The cook should see the door while at the stove.', severity: 4, element: 'stove', violation: 'stove_back_to_door', recommendation: 'Place a small mirror behind the stove to reflect the door.'),
    FengShuiRule(id: 'stove_sink_conflict', category: 'kitchen', principle: 'The stove and sink should NOT be directly opposite or adjacent.', severity: 3, element: 'stove', violation: 'fire_water_conflict', recommendation: 'Place a Wood element between the stove and sink.'),
    FengShuiRule(id: 'dining_table_shape', category: 'dining', principle: 'Round or oval dining tables promote harmonious energy.', severity: 2, element: 'dining_table', violation: 'sharp_table', recommendation: 'Consider a round table. Soften corners with a tablecloth.'),
    FengShuiRule(id: 'dining_mirror', category: 'dining', principle: 'A mirror reflecting the dining table doubles abundance.', severity: 2, element: 'mirror', violation: 'no_dining_mirror', recommendation: 'Hang a mirror that reflects the dining table.'),
    FengShuiRule(id: 'entrance_clutter', category: 'entrance', principle: 'The entrance must be clear, well-lit, and welcoming.', severity: 5, element: 'entrance', violation: 'entrance_cluttered', recommendation: 'Clear the entrance of clutter. Add good lighting.'),
    FengShuiRule(id: 'entrance_mirror', category: 'entrance', principle: 'A mirror directly facing the front door bounces chi back out.', severity: 4, element: 'mirror', violation: 'mirror_at_entrance', recommendation: 'Move the mirror to a side wall in the foyer.'),
    FengShuiRule(id: 'toilet_lid', category: 'bathroom', principle: 'Toilet lids should be kept closed.', severity: 3, element: 'toilet', violation: 'toilet_lid_open', recommendation: 'Always close the toilet lid when not in use.'),
    FengShuiRule(id: 'bathroom_above_entrance', category: 'bathroom', principle: 'A bathroom should NOT be above the main entrance.', severity: 4, element: 'bathroom', violation: 'bathroom_over_entrance', recommendation: 'Use strong Earth elements in the bathroom to ground energy.'),
  ];

  static const fiveElements = <String, FiveElement>{
    'wood': FiveElement(name: 'Wood', colors: ['green', 'brown'], shapes: ['rectangular', 'columnar'], direction: ['east', 'southeast'], enhances: 'fire', weakens: 'earth', materials: ['wood', 'plants', 'flowers']),
    'fire': FiveElement(name: 'Fire', colors: ['red', 'orange', 'pink', 'purple'], shapes: ['triangular', 'pointed'], direction: ['south'], enhances: 'earth', weakens: 'metal', materials: ['candles', 'lighting', 'electronics']),
    'earth': FiveElement(name: 'Earth', colors: ['yellow', 'beige', 'terracotta'], shapes: ['square', 'flat'], direction: ['center', 'southwest', 'northeast'], enhances: 'metal', weakens: 'water', materials: ['ceramics', 'stone', 'brick']),
    'metal': FiveElement(name: 'Metal', colors: ['white', 'gold', 'silver', 'gray'], shapes: ['round', 'spherical'], direction: ['west', 'northwest'], enhances: 'water', weakens: 'wood', materials: ['metal', 'iron', 'steel', 'brass']),
    'water': FiveElement(name: 'Water', colors: ['blue', 'black'], shapes: ['wavy', 'irregular'], direction: ['north'], enhances: 'wood', weakens: 'fire', materials: ['glass', 'mirrors', 'water features']),
  };

  static List<FengShuiRule> getRulesByCategory(String category) =>
      rules.where((r) => r.category == category).toList();

  static List<FengShuiRule> getRulesByElement(String element) =>
      rules.where((r) => r.element == element).toList();
}
