class Api::V1::ErrorSerializer
  def self.list_errors
    {
      status: 400,
      description: "invalid input. Please try again."
    }
  end
end
