<?php foreach ($books as $book): ?>
    <div>
        <h3><?php echo $book['TITLE']; ?></h3>
        <p><?php echo $book['DESCRIPTION']; ?></p>
        <p><?php echo $book['YEAR_PUBLICATION']; ?></p>
        <p><a href="index.php?action=update&id=<?php echo $book['ID_BOOK']; ?>">Editar</a> | 
        <a href="index.php?action=delete&id=<?php echo $book['ID_BOOK']; ?>">Eliminar</a></p>
    </div>
<?php endforeach; ?>
<a href="index.php?action=create">Agregar nuevo libro</a>
