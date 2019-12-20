class Image
  attr_accessor :image

  def initialize(image)
    @image = image
  end

  def find_ones
    pixels_to_blur = []
    @image.each_with_index do |row, row_index|
      row.each_with_index do |pixel, column_index|
        if pixel == 1
          pixels_to_blur << [row_index, column_index]
        end
      end
    end
    pixels_to_blur
  end

  def blur
    pixels_to_blur = find_ones
      @image.each_with_index do |row, row_index|
        row.each_with_index do |pixel, column_index|
          pixels_to_blur.each do |row_location, column_location|

            if row_index == row_location && column_index == column_location
              @image[row_index -1][column_index] = 1 unless row_index == 0 #above
              @image[row_index +1][column_index] = 1 unless row_index >= @image.size - 1 #below
              @image[row_index][column_index -1] = 1 unless column_index == 0 #to left
              @image[row_index][column_index +1] = 1 unless column_index >= row.size - 1 #to right
          end
        end
      end
    end
  end

  def output_image
    @image.each do |row|
    puts row.join(", ")
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.blur
image.output_image