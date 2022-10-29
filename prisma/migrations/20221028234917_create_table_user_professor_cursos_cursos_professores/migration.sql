-- CreateTable

CREATE TABLE
    "User" (
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        "email" TEXT NOT NULL,
        "name" TEXT NOT NULL,
        "password" TEXT NOT NULL,
        "role" TEXT NOT NULL,
        "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    );

-- CreateTable

CREATE TABLE
    "Professor" (
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        "name" TEXT NOT NULL
    );

-- CreateTable

CREATE TABLE
    "Cursos" (
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        "name" TEXT NOT NULL,
        "description" TEXT NOT NULL
    );

-- CreateTable

CREATE TABLE
    "CursosProfessores" (
        "cursoID" INTEGER NOT NULL,
        "professorID" INTEGER NOT NULL,
        PRIMARY KEY ("cursoID", "professorID"),
        CONSTRAINT "CursosProfessores_cursoID_fkey" FOREIGN KEY ("cursoID") REFERENCES "Cursos" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
        CONSTRAINT "CursosProfessores_professorID_fkey" FOREIGN KEY ("professorID") REFERENCES "Professor" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
    );

-- CreateIndex

CREATE UNIQUE INDEX "User_email_key" ON "User"("email");