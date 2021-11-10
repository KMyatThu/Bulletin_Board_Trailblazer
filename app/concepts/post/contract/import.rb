module Post::Contract
    class Import < Reform::Form

      property :file

      validates :file, presence: true
    end
end