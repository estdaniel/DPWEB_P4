<?php
// Modelo para manejar operaciones sobre los libros
require_once 'config/database.php';

class BookModel {
    public $id;
    public $title;
    public $description;
    public $year_publication;
    public $author_id;
    public $genre_id;

    // Obtener todos los libros
    public static function getAllBooks() {
        global $pdo;
        $stmt = $pdo->query("SELECT * FROM book");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Insertar un nuevo libro
    public function insertBook() {
        global $pdo;
        $sql = "INSERT INTO book (TITLE, DESCRIPTION, YEAR_PUBLICATION, ID_AUTHOR, ID_GENRE)
                VALUES (:title, :description, :year_publication, :author_id, :genre_id)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ':title' => $this->title,
            ':description' => $this->description,
            ':year_publication' => $this->year_publication,
            ':author_id' => $this->author_id,
            ':genre_id' => $this->genre_id
        ]);
    }

    // Actualizar un libro existente
    public function updateBook() {
        global $pdo;
        $sql = "UPDATE book SET TITLE = :title, DESCRIPTION = :description, YEAR_PUBLICATION = :year_publication, 
                ID_AUTHOR = :author_id, ID_GENRE = :genre_id WHERE ID_BOOK = :id";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ':id' => $this->id,
            ':title' => $this->title,
            ':description' => $this->description,
            ':year_publication' => $this->year_publication,
            ':author_id' => $this->author_id,
            ':genre_id' => $this->genre_id
        ]);
    }

    // Eliminar un libro
    public static function deleteBook($id) {
        global $pdo;
        $sql = "DELETE FROM book WHERE ID_BOOK = :id";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':id' => $id]);
    }
}
