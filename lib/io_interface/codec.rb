module IOInterface
  class Codec

    INSTRUCTION_RELATION = {
      'L' => :turn_left,
      'R' => :turn_right,
      'M' => :move,
    }

    DIRECTION_RELATION = {
      'N' => :north,
      'E' => :east,
      'S' => :south,
      'W' => :west
    }

    def valid_direction? data
      DIRECTION_RELATION.has_key? data
    end

    def encode_direction data
      DIRECTION_RELATION[ data ]
    end

    def decode_direction data
      DIRECTION_RELATION.key data
    end

    def encode_instruction data
      INSTRUCTION_RELATION[ data ]
    end
  end
end