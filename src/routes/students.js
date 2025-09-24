const express = require("express");
const router = express.Router();
const studentController = require("../controllers/studentsController");

// Create a student
router.post("/", studentController.createStudent);

// Get all students
router.get("/", studentController.getAllStudents);

// Get student by ID
router.get("/:id", studentController.getStudentById);

// Update student
router.put("/:id", studentController.updateStudent);

// Delete student
router.delete("/:id", studentController.deleteStudent);

module.exports = router;
