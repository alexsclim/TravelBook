class CreateImageService
  attr_reader :images, :location

  def initialize(location, images)
    @images = images
    @location = location
  end

  def call
    if @images
      @images.each do |image|
        @location.pictures.create(image: image)
      end
    end
  end
end
