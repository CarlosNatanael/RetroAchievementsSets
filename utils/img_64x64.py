from PIL import Image
imagem_original = Image.open("bagde.png")
imagem_redimensionada = imagem_original.resize((96, 96), Image.LANCZOS)
imagem_redimensionada.save("bagde1.png")