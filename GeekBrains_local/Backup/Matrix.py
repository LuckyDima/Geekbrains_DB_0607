matrix = [[0.5, 0, 0, 0, 0],
          [1, 0.5, 0, 0, 0],
          [1, 1, 0.5, 0, 0],
          [1, 1, 1, 0.5, 0],
          [1, 1, 1, 1, 0.5]]

matrix_t = list(zip(*matrix))
# Вывод матриц
# print(matrix)
# print(matrix_t)

for el in matrix_t:
    print(el)

