class GameSerializer
  include FastJsonapi::ObjectSerializer
  attributes :score, :player_id, :created_at, :updated_at, :player
# :player gives me access to associated player with username. Avoids unnecessary bloat.
end
