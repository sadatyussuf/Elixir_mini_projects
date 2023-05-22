defmodule PaintByNumber do
  def palette_bit_size(color_count,num_bits \\ 1) do

   cond do
     Integer.pow(2,num_bits) < color_count -> palette_bit_size(color_count,num_bits + 1)
     true -> num_bits
   end

  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::size(2), 1::size(2), 2::size(2), 3::size(2)>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    num_of_bits = palette_bit_size(color_count)
   <<pixel_color_index::size(num_of_bits), picture::bitstring>>
  end

  def get_first_pixel(picture, color_count) do
    num_of_bits = palette_bit_size(color_count)
     case picture do
         <<px::size(num_of_bits), picture::bitstring>> -> px
         _ -> nil
     end
  end

  def drop_first_pixel(picture, color_count) do
  num_of_bits = palette_bit_size(color_count)
     case picture do
         <<_::size(num_of_bits), picture::bitstring>> ->picture
         _ -> <<>>
     end
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
