const { Router } = require("express");
const todoController = require("../controller/TodoController")
const router = Router();

router.get("/todos",todoController.displayTodos);
router.post("/todos", todoController.createNewTodos);
router.get("/todos/:id",todoController.getSpecificTodo);
router.delete("/todos/:id",todoController.deleteTodos);
router.put("/todos/:id",todoController.completTodos);

module.exports = router