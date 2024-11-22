<form action="" method="POST">
    <input type="text" name="title" placeholder="Título" value="<?php echo isset($book) ? $book['TITLE'] : ''; ?>" required>
    <input type="text" name="description" placeholder="Descripción" value="<?php echo isset($book) ? $book['DESCRIPTION'] : ''; ?>" required>
    <input type="number" name="year_publication" placeholder="Año de publicación" value="<?php echo isset($book) ? $book['YEAR_PUBLICATION'] : ''; ?>" required>
    <input type="number" name="author_id" placeholder="ID Autor" value="<?php echo isset($book) ? $book['ID_AUTHOR'] : ''; ?>" required>
    <input type="number" name="genre_id" placeholder="ID Género" value="<?php echo isset($book) ? $book['ID_GENRE'] : ''; ?>" required>
    <button type="submit">Guardar</button>
</form>
