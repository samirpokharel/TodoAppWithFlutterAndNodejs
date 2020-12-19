const { boolean } = require("joi");
const Joi = require("joi");
const mongoose = require("mongoose");

//todo schema
const todoSchema = new mongoose.Schema({
  title: {
    type: String,
    required: true,
    minlength: 3,
    maxlength: 256,
  },
  isComplet: {
    type: Boolean,
    default: false,
  },
});

//todo model
const Todo = mongoose.model("todos", todoSchema);

// display all todo
module.exports.displayTodos = async (req, res) => {
  const todos = await Todo.find();
  res.send(todos);
};

// create new todos
module.exports.createNewTodos = async (req, res) => {
  const { error } = validateTodo(req.body);
  if (error) return res.status(400).send(error.message);
  const todo = new Todo({
    title: req.body.title,
    isComplet: req.body.isComplet,
  });
  const result = await todo.save();
  res.send(result);
};

// deltet todos
module.exports.deleteTodos = async (req, res) => {
  const todo = await Todo.findByIdAndRemove(req.params.id);
  if (!todo) return res.status(400).send("No todo found with this id");
  res.send(todo);
};

// completTodos
module.exports.completTodos = async (req, res) => {
  const { error } = validateTodo(req.body);
  if (error) return res.status(400).send(error.message);
  const todo = await Todo.findByIdAndUpdate(
    req.params.id,
    { isComplet: req.body.isComplet },
    { new: true }
  );
  if (!todo) return res.status(404).send(`No todos found with this id`);
  res.send(todo);
};

// get specific todo
module.exports.getSpecificTodo = async (req, res) => {
  const todo = await Todo.findById(req.params.id);
  if (!todo) res.status(404).send(`No todos found with this id`);
  res.send(todo);
};

//validate todo
function validateTodo(todos) {
  const schema = Joi.object({
    title: Joi.string(),
    isComplet: Joi.boolean(),
  });
  return schema.validate(todos);
}
