<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Libreria las apuestas</title>
    <link rel="stylesheet" href="Css/Estilo1.css">
</head>
<body>
    <header>
        <h1>Gestión de Libros</h1>
    </header>
    <div class="container">
        <?php 
        require_once 'controller/BookController.php';

        $action = isset($_GET['action']) ? $_GET['action'] : 'index';
        $id = isset($_GET['id']) ? $_GET['id'] : null;

        $controller = new BookController();

        if ($action == 'create') {
            $controller->create();
        } elseif ($action == 'update' && $id) {
            $controller->update($id);
        } elseif ($action == 'delete' && $id) {
            $controller->delete($id);
        } else {
            $controller->index();
        }
        ?>
    </div>
    <footer>
        <p>Libreria las apuestas &copy; 2024</p>
    </footer>
</body>
</html>
