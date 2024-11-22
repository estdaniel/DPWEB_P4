<?php
require_once 'models/BookModel.php';

class BookController {
    // Mostrar todos los libros
    public function index() {
        $books = BookModel::getAllBooks();
        include 'views/bookList.php';
    }

    // Crear un nuevo libro
    public function create() {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $book = new BookModel();
            $book->title = $_POST['title'];
            $book->description = $_POST['description'];
            $book->year_publication = $_POST['year_publication'];
            $book->author_id = $_POST['author_id'];
            $book->genre_id = $_POST['genre_id'];
            $book->insertBook();
            header("Location: index.php");
        } else {
            include 'views/bookForm.php';
        }
    }

    // Actualizar un libro
    public function update($id) {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $book = new BookModel();
            $book->id = $id;
            $book->title = $_POST['title'];
            $book->description = $_POST['description'];
            $book->year_publication = $_POST['year_publication'];
            $book->author_id = $_POST['author_id'];
            $book->genre_id = $_POST['genre_id'];
            $book->updateBook();
            header("Location: index.php");
        } else {
            $book = BookModel::getAllBooks();
            include 'views/bookForm.php';
        }
    }

    // Eliminar un libro
    public function delete($id) {
        BookModel::deleteBook($id);
        header("Location: index.php");
    }
}
