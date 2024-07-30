package main

import (
	"fmt"
	"log"

	"github.com/gofiber/fiber/v2"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

type User struct {
	gorm.Model
	Name     string `json:"name"`
	Password string `json:"password"`
	Email    string `json:"email"`
	Role_id  int    `json:"role_id"`
}

var DB *gorm.DB
var err error

func initDatabase() {
	dsn := "root:[Lösenord]@tcp(127.0.0.1:3306)/axamini?charset=utf8mb4&parseTime=True&loc=Local"
	DB, err = gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		log.Fatal("Failed to connect to database", err)
	}

	fmt.Println("Database connection successful")
	DB.AutoMigrate(User{})
}

func main() {
	app := fiber.New()

	// Define routes
	initDatabase()
	init_routes(app)

	// Start the server on port 3000
	app.Listen(":3000")
}

func init_routes(app *fiber.App) {
	app.Get("/", func(c *fiber.Ctx) error {
		return c.SendString("Hello, World!")
	})
	app.Get("/api/tasks", func(c *fiber.Ctx) error {
		return c.JSON("Tasks : Tasks")
	})
	app.Get("/api/users", createUser)
	app.Post("/api/users", createUser)
}

func createUser(c *fiber.Ctx) error {
	user := new(User)
	if err := c.BodyParser(user); err != nil {
		return c.Status(400).SendString(err.Error())
	}

	DB.Create(&user)
	return c.Status(201).JSON(user)
}

/* func getUsers(c *fiber.Ctx) error{

} */
