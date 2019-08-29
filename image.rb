class Image

  def initialize(array)
    @image = array
  end

  def output_image
    @image.each do |row|
      puts row.join
    end
  end

  def blur!(distance=1)
    distance.times do
      ones!
    end
  end

  private

    def ones
      ones = []
      @image.each_with_index do |row, i|
        row.each_with_index do |x, row_i|
          ones << [i, row_i] if x == 1
        end
      end

      ones.each do |i|
        @image[i[0]][i[1] + 1] = 1 if i[1] + 1 <= @image[i[0]].length - 1
        @image[i[0]][i[1] - 1] = 1 if i[1] - 1 >= 0
        @image[i[0] + 1][i[1]] = 1 if i[0] + 1 <= @image.length - 1
        @image[i[0] - 1][i[1]] = 1 if i[0] - 1 >= 0
      end
    end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0],
])
image.output_image