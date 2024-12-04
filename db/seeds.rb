# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

RecipeIngredient.destroy_all
Survey.destroy_all
PlanRecipe.destroy_all
ShoppingList.destroy_all
Plan.destroy_all
Ingredient.destroy_all
Recipe.destroy_all
User.destroy_all

User.create!(
  first_name: 'Rita',
  last_name: 'Salema',
  email: 'pintorafael1999@gmail.com',
  password: 'gcm12345'
)

# Seed 30 recipes manually
recipes = [
  # {
  #   name: "Spaghetti Carbonara",
  #   ingredients_list: { spaghetti: "200g", eggs:"2", bacon: "50g", 'parmesan cheese': "10g", garlic: "1 clove", 'black pepper': "pinch" },
  #   servings: 4,
  #   calories: 450,
  #   restrictions: ["normal"],
  #   instructions: "Cook pasta, fry bacon, mix with eggs and cheese, combine with pasta.",
  #   cook_time: 20,
  #   image_url: "https://www.sipandfeast.com/wp-content/uploads/2022/09/spaghetti-carbonara-recipe-snippet.jpg"
  # },
  # {
  #   name: "Chicken Alfredo",
  #   ingredients_list: ["chicken breast", "fettucine pasta", "cream", "parmesan cheese", "garlic", "butter"],
  #   servings: 4,
  #   calories: 600,
  #   restrictions: ["normal"],
  #   instructions: "Cook chicken, make creamy sauce, toss with pasta.",
  #   cook_time: 30,
  #   image_url: "https://www.budgetbytes.com/wp-content/uploads/2022/07/Chicken-Alfredo-above.jpg"
  # },
  # {
  #   name: "Vegetable Stir-Fry",
  #   ingredients_list: ["broccoli", "carrots", "bell peppers", "soy sauce", "garlic", "ginger", "tofu"],
  #   servings: 4,
  #   calories: 200,
  #   restrictions: ["vegan"],
  #   instructions: "Stir-fry vegetables and tofu, add soy sauce and serve.",
  #   cook_time: 20,
  #   image_url: "https://www.inspiredtaste.net/wp-content/uploads/2022/04/Veggie-Stir-Fry-Recipe-3-1200-1200x800.jpg"
  # },
  # {
  #   name: "Beef Tacos",
  #   ingredients_list: ["ground beef", "taco shells", "cheese", "lettuce", "tomato", "sour cream"],
  #   servings: 4,
  #   calories: 300,
  #   restrictions: ["normal"],
  #   instructions: "Cook beef, assemble tacos with toppings.",
  #   cook_time: 15,
  #   image_url: "https://kaynutrition.com/wp-content/uploads/2023/08/shredded-beef-tacos.jpg"
  # },
  # {
  #   name: "Pasta Primavera",
  #   ingredients_list: ["penne pasta", "zucchini", "cherry tomatoes", "garlic", "olive oil", "parmesan cheese"],
  #   servings: 4,
  #   calories: 350,
  #   restrictions: ["vegetarian"],
  #   instructions: "Cook pasta, sauté vegetables, toss with pasta and cheese.",
  #   cook_time: 25,
  #   image_url: "https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/4DF59787-5161-4765-9192-3DFC138E9931/Derivates/80b7ae85-7dd5-488f-9318-6fea4601cf2f.jpg"
  # },
  # {
  #   name: "Grilled Cheese Sandwich",
  #   ingredients_list: ["bread", "cheese", "butter"],
  #   servings: 2,
  #   calories: 400,
  #   restrictions: ["normal"],
  #   instructions: "Butter bread, add cheese, grill until golden.",
  #   cook_time: 10,
  #   image_url: "https://assets.epicurious.com/photos/59b2bccaed60845e59e6d3d1/4:3/w_4992,h_3744,c_limit/shutterstock_321217517.jpg"
  # },
  # {
  #   name: "Vegetable Soup",
  #   ingredients_list: ["carrots", "celery", "onions", "potatoes", "tomato", "vegetable broth"],
  #   servings: 6,
  #   calories: 150,
  #   restrictions: ["vegan"],
  #   instructions: "Simmer vegetables in broth until tender.",
  #   cook_time: 60,
  #   image_url: "https://thecozyapron.com/wp-content/uploads/2018/07/vegetable-soup_thecozyapron_1.jpg"
  # },
  # {
  #   name: "Lentil Soup",
  #   ingredients_list: ["lentils", "carrots", "celery", "tomatoes", "onions", "vegetable broth"],
  #   servings: 6,
  #   calories: 250,
  #   restrictions: ["vegan"],
  #   instructions: "Simmer lentils and vegetables in broth.",
  #   cook_time: 45,
  #   image_url: "https://cookieandkate.com/images/2019/01/best-lentil-soup-recipe-4.jpg"
  # },
  # {
  #   name: "Chicken Marsala",
  #   ingredients_list: ["chicken breasts", "marsala wine", "mushrooms", "butter", "parsley"],
  #   servings: 4,
  #   calories: 450,
  #   restrictions: ["gluten free"],
  #   instructions: "Cook chicken and mushrooms, deglaze with wine, simmer to thicken.",
  #   cook_time: 40,
  #   image_url: "https://culinarybutterfly.com/wp-content/uploads/2021/08/Chicken-Marsala-1.png"
  # },
  # {
  #   name: "Shrimp Scampi",
  #   ingredients_list: ["shrimp", "garlic", "butter", "white wine", "lemon juice", "parsley", "spaghetti"],
  #   servings: 4,
  #   calories: 350,
  #   restrictions: ["normal"],
  #   instructions: "Cook shrimp in garlic butter, add wine and lemon juice, toss with pasta.",
  #   cook_time: 20,
  #   image_url: "https://www.allrecipes.com/thmb/jiV_4f8vXFle1RdFLgd8-_31J3M=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/229960-shrimp-scampi-with-pasta-DDMFS-4x3-e065ddef4e6d44479d37b4523808cc23.jpg"
  # },
  # {
  #   name: "Quinoa Salad",
  #   ingredients_list: ["quinoa", "cucumber", "tomato", "feta cheese", "olive oil", "lemon juice"],
  #   servings: 4,
  #   calories: 200,
  #   restrictions: ["vegetarian"],
  #   instructions: "Cook quinoa, mix with chopped vegetables, drizzle with olive oil and lemon juice.",
  #   cook_time: 15,
  #   image_url: "https://www.eatingbirdfood.com/wp-content/uploads/2024/04/easy-quinoa-salad-hero-cropped.jpg"
  # },
  # {
  #   name: "Stuffed Bell Peppers",
  #   ingredients_list: ["bell peppers", "ground beef", "rice", "tomato sauce", "cheese", "onions"],
  #   servings: 4,
  #   calories: 300,
  #   restrictions: ["normal"],
  #   instructions: "Stuff peppers with beef and rice mixture, bake with tomato sauce and cheese.",
  #   cook_time: 40,
  #   image_url: "https://www.howtocook.recipes/wp-content/uploads/2021/09/Stuffed-peppers-recipe.jpg"
  # },
  # {
  #   name: "Vegan Pad Thai",
  #   ingredients_list: ["rice noodles", "tofu", "peanut butter", "lime", "soy sauce", "bean sprouts"],
  #   servings: 4,
  #   calories: 250,
  #   restrictions: ["vegan"],
  #   instructions: "Cook noodles, stir-fry tofu, mix sauce, combine with vegetables and noodles.",
  #   cook_time: 25,
  #   image_url: "https://pinchofyum.com/wp-content/uploads/Vegetarian-Pad-Thai-Recipe.jpg"
  # },
  # {
  #   name: "Baked Salmon",
  #   ingredients_list: ["salmon fillet", "lemon", "garlic", "olive oil", "parsley"],
  #   servings: 4,
  #   calories: 400,
  #   restrictions: ["gluten free"],
  #   instructions: "Season salmon, bake until cooked through.",
  #   cook_time: 25,
  #   image_url: "https://www.acouplecooks.com/wp-content/uploads/2020/01/Baked-Salmon-056.jpg"
  # },
  # {
  #   name: "Minestrone Soup",
  #   ingredients_list: ["zucchini", "carrots", "celery", "tomatoes", "pasta", "vegetable broth"],
  #   servings: 6,
  #   calories: 250,
  #   restrictions: ["vegan"],
  #   instructions: "Simmer vegetables in broth, add pasta and cook until tender.",
  #   cook_time: 50,
  #   image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2021/03/Classic-Minestrone-Soup-13720e5.jpg?resize=768,574"
  # },
  # {
  #   name: "gluten free Pancakes",
  #   ingredients_list: ["gluten free flour", "milk", "eggs", "butter", "maple syrup"],
  #   servings: 4,
  #   calories: 300,
  #   restrictions: ["gluten free"],
  #   instructions: "Mix batter, cook pancakes on griddle, serve with syrup.",
  #   cook_time: 20,
  #   image_url: "https://glutenfreebaking.com/wp-content/uploads/2024/06/Stack-of-gluten free-pancakes.jpg"
  # },
  # {
  #   name: "Chickpea Curry",
  #   ingredients_list: ["chickpeas", "coconut milk", "curry powder", "onions", "garlic", "tomatoes"],
  #   servings: 4,
  #   calories: 300,
  #   restrictions: ["vegan"],
  #   instructions: "Simmer chickpeas in spiced coconut milk sauce.",
  #   cook_time: 30,
  #   image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/kadala-curry-fad4df3.jpg"
  # },
  # {
  #   name: "Eggplant Parmesan",
  #   ingredients_list: ["eggplant", "tomato sauce", "mozzarella", "parmesan", "bread crumbs"],
  #   servings: 4,
  #   calories: 350,
  #   restrictions: ["vegetarian"],
  #   instructions: "Bread eggplant slices, bake with sauce and cheese.",
  #   cook_time: 45,
  #   image_url: "https://www.theseasonedmom.com/wp-content/uploads/2024/07/baked-eggplant-parmesan-recipe-9-500x375.jpg"
  # },
  # {
  #   name: "Tofu Scramble",
  #   ingredients_list: ["tofu", "turmeric", "onions", "bell peppers", "spinach"],
  #   servings: 2,
  #   calories: 150,
  #   restrictions: ["vegan"],
  #   instructions: "Crumble tofu, sauté with vegetables and seasoning.",
  #   cook_time: 10,
  #   image_url: "https://thealmondeater.com/wp-content/uploads/2021/01/Tofu-Scramble-1-5.jpg"
  # },
  # {
  #   name: "Caprese Salad",
  #   ingredients_list: ["tomatoes", "mozzarella", "basil", "olive oil", "balsamic glaze"],
  #   servings: 2,
  #   calories: 250,
  #   restrictions: ["vegetarian"],
  #   instructions: "Layer tomato and mozzarella slices, drizzle with olive oil and balsamic glaze, garnish with basil.",
  #   cook_time: 10,
  #   image_url: "https://downshiftology.com/wp-content/uploads/2019/07/How-to-Make-Caprese-Salad-1.jpg"
  # },
  # {
  #   name: "Chicken Stir-Fry",
  #   ingredients_list: ["chicken breast", "broccoli", "carrots", "soy sauce", "ginger", "garlic"],
  #   servings: 4,
  #   calories: 350,
  #   restrictions: ["normal"],
  #   instructions: "Stir-fry chicken and vegetables in soy sauce and ginger.",
  #   cook_time: 20,
  #   image_url: "https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2021/05/Chicken-Stir-Fry-main-1.jpg"
  # },
  # {
  #   name: "Avocado Toast",
  #   ingredients_list: ["avocado", "whole-grain bread", "lemon", "red pepper flakes"],
  #   servings: 2,
  #   calories: 200,
  #   restrictions: ["vegan"],
  #   instructions: "Mash avocado, spread on toasted bread, sprinkle with lemon juice and red pepper flakes.",
  #   cook_time: 5,
  #   image_url: "https://www.eatingwell.com/thmb/PM3UlLhM0VbE6dcq9ZFwCnMyWHI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/EatingWell-April-Avocado-Toast-Directions-04-5b5b86524a3d4b35ac4c57863f6095dc.jpg"
  # },
  # {
  #   name: "Zucchini Noodles with Pesto",
  #   ingredients_list: ["zucchini", "basil pesto", "parmesan cheese", "pine nuts"],
  #   servings: 2,
  #   calories: 300,
  #   restrictions: ["gluten free"],
  #   instructions: "Spiralize zucchini, toss with pesto, top with parmesan and pine nuts.",
  #   cook_time: 10,
  #   image_url: "https://cookieandkate.com/images/2016/06/zucchini-pesto-noodles-recipe-1-1.jpg"
  # },
  # {
  #   name: "Grilled Cheese Sandwich",
  #   ingredients_list: ["bread", "cheddar cheese", "butter"],
  #   servings: 2,
  #   calories: 400,
  #   restrictions: ["normal"],
  #   instructions: "Butter bread slices, sandwich cheese between, grill until golden.",
  #   cook_time: 10,
  #   image_url: "https://assets.epicurious.com/photos/59b2bccaed60845e59e6d3d1/4:3/w_4992,h_3744,c_limit/shutterstock_321217517.jpg"
  # },
  # {
  #   name: "Vegetable Stir-Fry",
  #   ingredients_list: ["broccoli", "carrots", "snap peas", "soy sauce", "ginger", "garlic"],
  #   servings: 4,
  #   calories: 250,
  #   restrictions: ["vegan"],
  #   instructions: "Stir-fry vegetables in soy sauce and ginger.",
  #   cook_time: 15,
  #   image_url: "https://www.thesmalltownfoodie.com/wp-content/uploads/2018/05/Vegetable-Stir-Fry2.png"
  # },
  # {
  #   name: "Beef Tacos",
  #   ingredients_list: ["ground beef", "taco shells", "lettuce", "tomatoes", "cheddar cheese", "sour cream"],
  #   servings: 4,
  #   calories: 350,
  #   restrictions: ["normal"],
  #   instructions: "Cook beef with seasoning, assemble tacos with toppings.",
  #   cook_time: 20,
  #   image_url: "https://feelgoodfoodie.net/wp-content/uploads/2024/04/Ground-Beef-Tacos-TIMG.jpg"
  # },
  # {
  #   name: "Cauliflower Pizza Crust",
  #   ingredients_list: ["cauliflower", "mozzarella", "egg", "tomato sauce", "toppings of choice"],
  #   servings: 4,
  #   calories: 200,
  #   restrictions: ["gluten free"],
  #   instructions: "Make crust with cauliflower, egg, and cheese, bake and top with sauce and toppings.",
  #   cook_time: 30,
  #   image_url: "https://www.foodandwine.com/thmb/NyGVVE00futNqcMGVJTWGtxBrf8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/cauliflower-crust-pizza-XL-RECIPE2016-cd86bbae9c844c198c5ca38c052ee3db.jpg"
  # },
  # {
  #   name: "Lentil Soup",
  #   ingredients_list: ["lentils", "carrots", "celery", "onions", "tomato paste", "vegetable broth"],
  #   servings: 6,
  #   calories: 250,
  #   restrictions: ["vegan"],
  #   instructions: "Simmer lentils with vegetables in broth until tender.",
  #   cook_time: 40,
  #   image_url: "https://www.noracooks.com/wp-content/uploads/2018/11/square-1.jpg"
  # },
  # {
  #   name: "Chocolate Mug Cake",
  #   ingredients_list: ["flour", "cocoa powder", "sugar", "milk", "butter", "baking powder"],
  #   servings: 1,
  #   calories: 300,
  #   restrictions: ["normal"],
  #   instructions: "Mix ingredients in a mug, microwave for 90 seconds.",
  #   cook_time: 2,
  #   image_url: "https://www.afarmgirlsdabbles.com/wp-content/uploads/2013/02/gooey-chocolate-cake-cups_AFarmgirlsDabbles_AFD-6_sq.jpg"
  # },
  # {
  #   name: "Stuffed Sweet Potatoes",
  #   ingredients_list: ["sweet potatoes", "black beans", "corn", "avocado", "salsa"],
  #   servings: 4,
  #   calories: 350,
  #   restrictions: ["vegan"],
  #   instructions: "Bake sweet potatoes, stuff with black beans, corn, and toppings.",
  #   cook_time: 45,
  #   image_url: "https://www.southernliving.com/thmb/3hynCD8Jf97b7W5v-xdSG6YWECc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Southern-Living_27362_HIH_Sweet-Potatoes_13279-3b3cb9761d354178a73e3ed8cc557211.jpg"
  # },
  {
    name: "Ploughman's Sandwich",
    ingredients_list: [
      { name: "bread", quantity: 2, unit: "slices" },
      { name: "cheddar cheese", quantity: 2, unit: "oz" },
      { name: "ham", quantity: 2, unit: "oz" },
      { name: "pickled onions", quantity: 2, unit: "tbsp" },
      { name: "lettuce", quantity: 1, unit: "leaf" },
      { name: "tomato", quantity: 2, unit: "slices" },
      { name: "cucumber", quantity: 3, unit: "slices" },
      { name: "butter", quantity: 1, unit: "tbsp" },
      { name: "mustard", quantity: 1, unit: "tsp" }
    ],
    servings: 1,
    calories: 615, # Note: Estimate for a sandwich like this
    restrictions: ["normal"],
    instructions: "Spread butter and mustard on the bread. Layer with cheese, ham, pickled onions, tomato, cucumber, and lettuce. Serve immediately.",
    cook_time: 10, # This is a no-cook recipe
    image_url: "https://hintofhelen.com/wp-content/uploads/2019/04/Ploughmans-Sandwich-Hint-of-Helen-2.jpg"
  },
  {
    name: "Hot Dog Roll-Ups",
    ingredients_list: [
      { name: "hot dogs", quantity: 8, unit: "count" },
      { name: "crescent roll dough", quantity: 1, unit: "can" },
      { name: "cheese", quantity: 8, unit: "slices" },
      { name: "mustard", quantity: 1, unit: "tsp" }
    ],
    servings: 8,
    calories: 350, # This is an estimate based on the ingredients
    restrictions: ["normal"],
    instructions: "Unroll the crescent roll dough and separate into triangles. Place a slice of cheese on each triangle, then add a hot dog. Roll the dough around the hot dog and cheese. Bake according to dough package instructions until golden brown.",
    cook_time: 20, # Estimate based on the baking time for crescent rolls
    image_url: "https://www.tasteofhome.com/wp-content/uploads/2018/01/exps16436_FF163882C01_13_3b-2.jpg"
  },
  {
    name: "Crispy Tater Caesar Salad",
    ingredients_list: [
      { name: "frozen tater tots", quantity: 1, unit: "bag" },
      { name: "romaine lettuce", quantity: 240, unit: "g" },
      { name: "caesar dressing", quantity: 120, unit: "g" },
      { name: "parmesan cheese", quantity: 30, unit: "g" },
      { name: "croutons", quantity: 40, unit: "g" },
      { name: "bacon", quantity: 4, unit: "slices" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 4,
    calories: 350, # Estimated calories per serving
    restrictions: ["vegetarian", "gluten free"], # Based on ingredients
    instructions: "Bake tater tots according to package instructions. While they bake, cook bacon and chop the lettuce. Toss lettuce with caesar dressing, parmesan, and croutons. Add the cooked tater tots and bacon to the salad, and sprinkle with black pepper before serving.",
    cook_time: 25, # Time for baking tater tots + cooking bacon
    image_url: "https://www.krazykitchenmom.com/wp-content/uploads/2024/03/CRISPY-PARMESAN-POTATOE-CASEAR-SALAD-AAA.jpg"
  },
  {
    name: "Teriyaki Salmon Bowl",
    ingredients_list: [
      { name: "salmon filets", quantity: 2, unit: "" },
      { name: "soy sauce", quantity: 60, unit: "g" },
      { name: "honey", quantity: 2, unit: "tbsp" },
      { name: "rice vinegar", quantity: 1, unit: "tbsp" },
      { name: "sesame oil", quantity: 1, unit: "tbsp" },
      { name: "garlic", quantity: 2, unit: "cloves" },
      { name: "ginger", quantity: 1, unit: "tsp" },
      { name: "sesame seeds", quantity: 1, unit: "tbsp" },
      { name: "green onions", quantity: 2, unit: "" },
      { name: "cooked rice", quantity: 360, unit: "g" },
      { name: "steamed broccoli", quantity: 150, unit: "g" }
    ],
    servings: 2,
    calories: 550, # Estimated calories per serving
    restrictions: ["normal"],
    instructions: "Prepare the teriyaki sauce by combining soy sauce, honey, rice vinegar, sesame oil, garlic, and ginger in a pan. Simmer until thickened. Cook salmon filets in a pan or oven. Serve the salmon over cooked rice with steamed broccoli, drizzle with the teriyaki sauce, and garnish with sesame seeds and green onions.",
    cook_time: 25, # Time to cook salmon, prepare rice, and steam broccoli
    image_url: "https://onebalancedlife.com/wp-content/uploads/2022/09/Teriyaki-Salmon-Bowls-scaled-735x980.jpg"
  },
  {
    name: "Meatless Grain Bowl",
    ingredients_list: [
      { name: "quinoa", quantity: 185, unit: "g" },
      { name: "chickpeas", quantity: 1, unit: "can" },
      { name: "avocado", quantity: 1, unit: "" },
      { name: "cucumber", quantity: 1, unit: "" },
      { name: "cherry tomatoes", quantity: 150, unit: "g" },
      { name: "red onion", quantity: 1, unit: "" },
      { name: "olive oil", quantity: 2, unit: "tbsp" },
      { name: "lemon juice", quantity: 1, unit: "tbsp" },
      { name: "tahini", quantity: 2, unit: "tbsp" },
      { name: "garlic powder", quantity: 1, unit: "tsp" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" },
      { name: "parsley", quantity: 2, unit: "tbsp" }
    ],
    servings: 2,
    calories: 450,
    restrictions: ["vegetarian", "vegan", "gluten free"],
    instructions: "Cook quinoa according to package instructions. In a bowl, combine chickpeas, cucumber, tomatoes, red onion, and avocado. Drizzle with olive oil, lemon juice, and tahini, and season with garlic powder, salt, and pepper. Serve the chickpea mixture over quinoa and garnish with chopped parsley.",
    cook_time: 25,
    image_url: "https://www.allrecipes.com/thmb/eQcR4i6x6JMlJ-h3J4-rwdHRH7s=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/8584633_Grain-Bowl_Shelia-Johnson_4x3-145618cfb0554b09af42380ab13d93f5.jpg"
  },
  {
    name: "Miso Noodle Soup in a Jar",
    ingredients_list: [
      { name: "miso paste", quantity: 2, unit: "tbsp" },
      { name: "soy sauce", quantity: 1, unit: "tbsp" },
      { name: "rice vinegar", quantity: 1, unit: "tbsp" },
      { name: "sesame oil", quantity: 1, unit: "tsp" },
      { name: "vegetable broth", quantity: 480, unit: "g" },
      { name: "dried ramen noodles", quantity: 1, unit: "pack" },
      { name: "green onion", quantity: 1, unit: "stalk" },
      { name: "garlic", quantity: 1, unit: "clove, minced" },
      { name: "mushrooms", quantity: 25, unit: "g" },
      { name: "spinach", quantity: 1, unit: "cup" },
      { name: "tofu", quantity: 90, unit: "g" },
      { name: "sesame seeds", quantity: 1, unit: "tsp" }
    ],
    servings: 2,
    calories: 300,
    restrictions: ["vegetarian", "vegan", "gluten free"],
    instructions: "Layer the ingredients in a jar starting with miso paste, soy sauce, rice vinegar, sesame oil, and garlic. Add the broth, ramen noodles, mushrooms, spinach, and tofu. When ready to eat, add boiling water to the jar, stir well, and let it sit for 3-4 minutes before serving. Garnish with green onions and sesame seeds.",
    cook_time: 10,
    image_url: "https://www.keepingthepeas.com/wp-content/uploads/2024/11/miso-soup-2.jpg"
  },
  {
    name: "Pasta Salad",
    ingredients_list: [
      { name: "pasta", quantity: 200, unit: "g" },
      { name: "cucumber", quantity: 1, unit: "" },
      { name: "red bell pepper", quantity: 1, unit: "" },
      { name: "red onion", quantity: 1, unit: "" },
      { name: "cherry tomatoes", quantity: 1, unit: "cup" },
      { name: "black olives", quantity: 40, unit: "g" },
      { name: "feta cheese", quantity: 75, unit: "g" },
      { name: "italian dressing", quantity: 120, unit: "g" },
      { name: "olive oil", quantity: 2, unit: "tbsp" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 6,
    calories: 300,
    restrictions: ["normal"],
    instructions: "Cook pasta according to package instructions, then rinse under cold water. In a large bowl, combine the pasta, cucumber, bell pepper, red onion, tomatoes, olives, and feta. Drizzle with Italian dressing and olive oil, and toss to combine. Season with salt and pepper to taste.",
    cook_time: 15,
    image_url: "https://www.inspiredtaste.net/wp-content/uploads/2018/12/Easy-Pasta-Salad-Recipe-2-1200.jpg"
  },
  {
    name: "Grilled Cheese Sandwich",
    ingredients_list: [
      { name: "bread", quantity: 2, unit: "slices" },
      { name: "butter", quantity: 2, unit: "tbsp" },
      { name: "cheddar cheese", quantity: 2, unit: "slices" }
    ],
    servings: 1,
    calories: 400,
    restrictions: ["normal"],
    instructions: "Butter one side of each slice of bread. Place a slice of cheese between the unbuttered sides of the bread. Grill the sandwich in a pan over medium heat, flipping once, until both sides are golden brown and the cheese is melted.",
    cook_time: 10,
    image_url: "https://www.allrecipes.com/thmb/ICeU6n3kGzoTxOV4ONB0q_TpgYk=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/125434-GrilledCheeseoftheGods-mfs-3x2-067-267097af4d0b446ab646bba044445147.jpg"
  },
  {
    name: "Garden Fresh Tomato Soup",
    ingredients_list: [
      { name: "tomatoes", quantity: 6, unit: "" },
      { name: "onion", quantity: 1, unit: "" },
      { name: "garlic", quantity: 2, unit: "cloves" },
      { name: "olive oil", quantity: 2, unit: "tbsp" },
      { name: "vegetable broth", quantity: 4, unit: "cups" },
      { name: "basil", quantity: 20, unit: "g" },
      { name: "heavy cream", quantity: 120, unit: "g" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 4,
    calories: 250,
    restrictions: ["vegetarian", "gluten free"],
    instructions: "In a large pot, heat olive oil and sauté the onion and garlic until soft. Add chopped tomatoes, vegetable broth, and basil. Simmer for 20 minutes. Use an immersion blender to purée the soup until smooth. Stir in heavy cream and season with salt and pepper. Serve hot.",
    cook_time: 30,
    image_url: "https://www.yourhomebasedmom.com/wp-content/uploads/2021/08/fresh-tomato-soup-0008-500x500.jpg"
  },
  {
    name: "Belizean Chicken Stew",
    ingredients_list: [
      { name: "chicken thighs", quantity: 4, unit: "" },
      { name: "onion", quantity: 1, unit: "" },
      { name: "garlic", quantity: 3, unit: "cloves" },
      { name: "bell pepper", quantity: 1, unit: "" },
      { name: "tomatoes", quantity: 2, unit: "" },
      { name: "chicken broth", quantity: 2, unit: "cups" },
      { name: "carrots", quantity: 2, unit: "" },
      { name: "potatoes", quantity: 2, unit: "" },
      { name: "allspice", quantity: 1, unit: "tsp" },
      { name: "thyme", quantity: 1, unit: "tsp" },
      { name: "paprika", quantity: 1, unit: "tsp" },
      { name: "oil", quantity: 2, unit: "tbsp" },
      { name: "salt", quantity: 0, unit: "pinch" },
      { name: "black pepper", quantity: 0, unit: "pinch" }
    ],
    servings: 4,
    calories: 450,
    restrictions: ["normal"],
    instructions: "Heat oil in a large pot and brown chicken thighs. Remove chicken and sauté onion, garlic, and bell pepper until softened. Add tomatoes, chicken broth, carrots, potatoes, allspice, thyme, and paprika. Return chicken to the pot and simmer for 30-40 minutes until chicken is cooked through and vegetables are tender.",
    cook_time: 45,
    image_url: "https://i.ytimg.com/vi/PteheVy63Sw/maxresdefault.jpg"
  },
  {
    name: "Summer Pepper Salad",
    ingredients_list: [
      { name: "red bell pepper", quantity: 1, unit: "" },
      { name: "yellow bell pepper", quantity: 1, unit: "" },
      { name: "green bell pepper", quantity: 1, unit: "" },
      { name: "red onion", quantity: 75, unit: "g" },
      { name: "cucumber", quantity: 1, unit: "" },
      { name: "cherry tomatoes", quantity: 1, unit: "" },
      { name: "olive oil", quantity: 3, unit: "tbsp" },
      { name: "red wine vinegar", quantity: 1, unit: "tbsp" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" },
      { name: "fresh basil", quantity: 15, unit: "g" }
    ],
    servings: 4,
    calories: 150,
    restrictions: ["vegetarian", "vegan", "gluten free"],
    instructions: "In a large bowl, combine bell peppers, onion, cucumber, and tomatoes. Drizzle with olive oil and red wine vinegar, then toss to coat. Season with salt and pepper, and garnish with chopped basil before serving.",
    cook_time: 10,
    image_url: "https://www.allrecipes.com/thmb/8QovSHYGzeL3mTAzk9Ls7oEIvy0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/809179-56147a78aa7f4ae98188ed01d6655a2b.jpg"
  },
  {
    name: "Ukrainian Red Borscht Soup",
    ingredients_list: [
      { name: "beets", quantity: 3, unit: "" },
      { name: "potatoes", quantity: 2, unit: "" },
      { name: "carrots", quantity: 2, unit: "" },
      { name: "onion", quantity: 1, unit: "" },
      { name: "garlic", quantity: 3, unit: "cloves" },
      { name: "cabbage", quantity: 2, unit: "cups" },
      { name: "vegetable broth", quantity: 4, unit: "cups" },
      { name: "tomato paste", quantity: 2, unit: "tbsp" },
      { name: "vinegar", quantity: 1, unit: "tbsp" },
      { name: "sugar", quantity: 1, unit: "tsp" },
      { name: "bay leaves", quantity: 2, unit: "" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" },
      { name: "olive oil", quantity: 2, unit: "tbsp" },
      { name: "sour cream", quantity: 1, unit: "serving" },
      { name: "fresh dill", quantity: 1, unit: "serving" }
    ],
    servings: 6,
    calories: 200,
    restrictions: ["vegetarian", "vegan", "gluten free"],
    instructions: "In a large pot, sauté onion and garlic in olive oil until soft. Add beets, carrots, potatoes, and vegetable broth. Bring to a boil, then simmer for 20 minutes. Stir in cabbage, tomato paste, vinegar, sugar, bay leaves, salt, and pepper. Simmer for another 10-15 minutes until vegetables are tender. Serve hot, topped with sour cream and fresh dill.",
    cook_time: 40,
    image_url: "https://sincerelytori.com/wp-content/uploads/2018/07/Traditional-Ukrainian-Red-Borscht-Soup-3.jpg"
  },
  {
    name: "Chef John's Creamy Mushroom Soup",
    ingredients_list: [
      { name: "mushrooms", quantity: 450, unit: "g" },
      { name: "butter", quantity: 4, unit: "tbsp" },
      { name: "onion", quantity: 1, unit: "" },
      { name: "garlic", quantity: 3, unit: "cloves" },
      { name: "vegetable broth", quantity: 4, unit: "cups" },
      { name: "heavy cream", quantity: 1, unit: "cup" },
      { name: "flour", quantity: 2, unit: "tbsp" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" },
      { name: "thyme", quantity: 1, unit: "tsp" },
      { name: "parsley", quantity: 1, unit: "for garnish" }
    ],
    servings: 4,
    calories: 300,
    restrictions: ["vegetarian"],
    instructions: "In a large pot, melt butter over medium heat and sauté onion and garlic until soft. Add mushrooms and cook until they release their liquid and soften. Stir in flour and cook for 1-2 minutes. Add vegetable broth, thyme, salt, and pepper. Bring to a boil, then reduce to a simmer for 15 minutes. Stir in heavy cream and cook for another 5 minutes. Serve hot, garnished with fresh parsley.",
    cook_time: 30,
    image_url: "https://www.allrecipes.com/thmb/DOgMge2dJv0Plavei2oPjvUm7o8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/235589-chef-johns-creamy-mushroom-soup-DDMFS-4x3-14854a8dc51c4c4c80cc5631299a873b.jpg"
  },
  {
    name: "Caldo de Pollo",
    ingredients_list: [
      { name: "chicken", quantity: 2, unit: "" },
      { name: "carrots", quantity: 2, unit: "" },
      { name: "potatoes", quantity: 2, unit: "" },
      { name: "corn on the cob", quantity: 2, unit: "" },
      { name: "zucchini", quantity: 1, unit: "" },
      { name: "celery", quantity: 2, unit: "" },
      { name: "onion", quantity: 1, unit: "" },
      { name: "garlic", quantity: 4, unit: "cloves" },
      { name: "cilantro", quantity: 15, unit: "g" },
      { name: "chicken broth", quantity: 8, unit: "cups" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" },
      { name: "lime", quantity: 1, unit: "" }
    ],
    servings: 6,
    calories: 350,
    restrictions: ["gluten free", "dairy free"],
    instructions: "In a large pot, combine chicken, chicken broth, carrots, potatoes, corn, zucchini, celery, onion, and garlic. Bring to a boil, then reduce heat and simmer for 30-40 minutes until the chicken is cooked through and the vegetables are tender. Season with salt and pepper to taste. Serve hot with fresh cilantro and lime wedges.",
    cook_time: 40,
    image_url: "https://www.dominicancooking.com/wp-content/uploads/sopa-de-pollo-recipe-chicken-soup-GLZ7731.jpg"
  },
  {
    name: "Beet Salad with Goat Cheese",
    ingredients_list: [
      { name: "beets", quantity: 4, unit: "" },
      { name: "goat cheese", quantity: 4, unit: "oz" },
      { name: "arugula", quantity: 2, unit: "cups" },
      { name: "walnuts", quantity: 30, unit: "g" },
      { name: "olive oil", quantity: 3, unit: "tbsp" },
      { name: "balsamic vinegar", quantity: 1, unit: "tbsp" },
      { name: "honey", quantity: 1, unit: "tsp" },
      { name: "salt", quantity: 0, unit: "pinch" },
      { name: "black pepper", quantity: 0, unit: "pinch" }
    ],
    servings: 4,
    calories: 250,
    restrictions: ["vegetarian"],
    instructions: "Roast beets and peel them. Slice into rounds and arrange on a platter with arugula. Drizzle with olive oil and balsamic vinegar, and drizzle honey over the top. Top with crumbled goat cheese, chopped walnuts, salt, and pepper to taste.",
    cook_time: 40,
    image_url: "https://www.allrecipes.com/thmb/1ZX36gQOJUbZQJpdxcAdH4xHFwY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/90500-beet-salad-with-goat-cheese-ddmfs-beauty-3x4-a41ec21c51e94b479362ce1e25c5eb44.jpg"
  },
  {
    name: "Sausage, Potato, and Kale Soup",
    ingredients_list: [
      { name: "italian sausage", quantity: 1, unit: "" },
      { name: "potatoes", quantity: 4, unit: "" },
      { name: "kale", quantity: 4, unit: "cups" },
      { name: "onion", quantity: 1, unit: "" },
      { name: "garlic", quantity: 3, unit: "cloves" },
      { name: "chicken broth", quantity: 6, unit: "cups" },
      { name: "heavy cream", quantity: 120, unit: "g" },
      { name: "olive oil", quantity: 2, unit: "tbsp" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" },
      { name: "red pepper flakes", quantity: 1, unit: "tsp" }
    ],
    servings: 6,
    calories: 350,
    restrictions: ["gluten free"],
    instructions: "In a large pot, heat olive oil and cook sausage until browned. Remove sausage and set aside. In the same pot, sauté onion and garlic until soft. Add potatoes and chicken broth, and bring to a boil. Reduce to a simmer and cook for 15 minutes, until potatoes are tender. Stir in kale, cooked sausage, and heavy cream. Simmer for another 5 minutes. Season with salt, pepper, and red pepper flakes (if using). Serve hot.",
    cook_time: 30,
    image_url: "https://www.allrecipes.com/thmb/0o7XkgApUcAWvFl0jzUc3mO00cA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/AR-231287-sausage-potato-kale-soup-DDMFS-4x3-Beauty-16a119bf3f3a47dd80d9b13e8b857ab6.jpg"
  },
  {
    name: "Authentic Russian Salad (Olivye)",
    ingredients_list: [
      { name: "potatoes", quantity: 4, unit: "" },
      { name: "carrots", quantity: 2, unit: "" },
      { name: "peas", quantity: 1, unit: "cup" },
      { name: "chicken breast", quantity: 1, unit: "" },
      { name: "pickles", quantity: 4, unit: "" },
      { name: "mayonnaise", quantity: 1, unit: "cup" },
      { name: "sour cream", quantity: 120, unit: "g" },
      { name: "mustard", quantity: 1, unit: "tbsp" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 6,
    calories: 350,
    restrictions: ["gluten free"],
    instructions: "Boil potatoes, carrots, and peas until tender. Drain and let cool. In a large bowl, mix cooled vegetables with diced chicken, pickles, and mayonnaise. Add sour cream and mustard, then season with salt and pepper to taste. Stir well and refrigerate for at least an hour before serving.",
    cook_time: 30,
    image_url: "https://wholemadeliving.com/wp-content/uploads/2017/09/Salat-Olivya-Feat-Image-scaled-e1648936102543.jpg"
  },
  {
    name: "Caprese Salad with Balsamic Reduction",
    ingredients_list: [
      { name: "tomatoes", quantity: 4, unit: "sliced" },
      { name: "fresh mozzarella", quantity: 8, unit: "oz, sliced" },
      { name: "fresh basil", quantity: 15, unit: "g" },
      { name: "balsamic vinegar", quantity: 120, unit: "g" },
      { name: "olive oil", quantity: 2, unit: "tbsp" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 4,
    calories: 250,
    restrictions: ["vegetarian"],
    instructions: "Arrange sliced tomatoes and mozzarella on a platter, alternating and overlapping. Drizzle with olive oil and balsamic reduction. Sprinkle with fresh basil, salt, and pepper to taste. Serve immediately.",
    cook_time: 10,
    image_url: "https://www.allrecipes.com/thmb/Usj7zOLJSQ5xqw-4dwWarvPNjJg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/AR-228126-caprese-salad-with-balsamic-reduction-ddmfs-2644-4x3-f32ac2b2fb9d4234884a752490fb015b.jpg"
  },
  {
    name: "The Denver Omelet",
    ingredients_list: [
      { name: "eggs", quantity: 4, unit: "" },
      { name: "bell pepper", quantity: 1, unit: "" },
      { name: "onion", quantity: 40, unit: "g" },
      { name: "ham", quantity: 40, unit: "g" },
      { name: "cheddar cheese", quantity: 28, unit: "g" },
      { name: "olive oil", quantity: 1, unit: "tbsp" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 2,
    calories: 250,
    restrictions: ["normal"],
    instructions: "Heat olive oil in a pan over medium heat. Add bell pepper and onion, cooking until softened. Add diced ham and cook for another 1-2 minutes. Pour beaten eggs over the vegetables and ham. Cook until the eggs are set, then sprinkle with shredded cheddar cheese. Fold the omelet in half and serve immediately.",
    cook_time: 10,
    image_url: "https://www.allrecipes.com/thmb/v_az-ZGdGXu53gi2ohnCkSg6fEY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/AR-263567-the-denver-omelet-DDMFS-4x3-d75a13b946e6453f8d5c22c539d0cb55.jpg"
  },
  {
    name: "Eggplant Caponata (Sicilian Version)",
    ingredients_list: [
      { name: "eggplant", quantity: 1, unit: "" },
      { name: "onion", quantity: 1, unit: "" },
      { name: "celery", quantity: 2, unit: "" },
      { name: "tomatoes", quantity: 2, unit: "" },
      { name: "green olives", quantity: 40, unit: "g" },
      { name: "capers", quantity: 2, unit: "tbsp" },
      { name: "red wine vinegar", quantity: 60, unit: "g" },
      { name: "sugar", quantity: 1, unit: "tbsp" },
      { name: "olive oil", quantity: 3, unit: "tbsp" },
      { name: "garlic", quantity: 2, unit: "cloves, minced" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" },
      { name: "fresh basil", quantity: 10, unit: "g" }
    ],
    servings: 4,
    calories: 180,
    restrictions: ["vegan", "gluten free"],
    instructions: "Heat olive oil in a pan over medium heat. Add eggplant, onion, and celery, and cook until softened. Stir in garlic, tomatoes, olives, capers, vinegar, and sugar. Simmer for about 20 minutes until the vegetables are tender and the sauce thickens. Season with salt and pepper, then garnish with fresh basil before serving.",
    cook_time: 30,
    image_url: "https://cookieandkate.com/images/2020/09/sicilian-caponata-recipe-1.jpg"
  },
  {
    name: "Slow Cooker Honey Garlic Chicken Noodles",
    ingredients_list: [
      { name: "chicken breasts", quantity: 4, unit: "" },
      { name: "honey", quantity: 60, unit: "g" },
      { name: "soy sauce", quantity: 60, unit: "g" },
      { name: "garlic", quantity: 4, unit: "cloves" },
      { name: "olive oil", quantity: 2, unit: "tbsp" },
      { name: "chicken broth", quantity: 120, unit: "g" },
      { name: "cornstarch", quantity: 1, unit: "tbsp" },
      { name: "egg noodles", quantity: 8, unit: "oz" },
      { name: "green onions", quantity: 2, unit: "" },
      { name: "sesame seeds", quantity: 1, unit: "tbsp" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 4,
    calories: 400,
    restrictions: ["gluten free"],
    instructions: "Place chicken breasts in the slow cooker. In a bowl, whisk together honey, soy sauce, garlic, olive oil, and chicken broth. Pour the mixture over the chicken. Cover and cook on low for 4 hours. Once cooked, shred the chicken and stir in the cornstarch mixed with water. Cook egg noodles according to package instructions, then stir them into the sauce. Garnish with green onions and sesame seeds. Serve hot.",
    cook_time: 25,
    image_url: "https://www.fooddolls.com/wp-content/uploads/2023/01/slow-cooker-honey-garlic-chicken9021.jpg"
  },
  {
    name: "Marry Me Chicken Tortellini",
    ingredients_list: [
      { name: "chicken breasts", quantity: 4, unit: "" },
      { name: "tortellini", quantity: 9, unit: "oz" },
      { name: "olive oil", quantity: 2, unit: "tbsp" },
      { name: "garlic", quantity: 4, unit: "cloves" },
      { name: "sun dried tomatoes", quantity: 40, unit: "g" },
      { name: "heavy cream", quantity: 1, unit: "cup" },
      { name: "chicken broth", quantity: 120, unit: "g" },
      { name: "parmesan cheese", quantity: 60, unit: "g" },
      { name: "basil", quantity: 1, unit: "tbsp" },
      { name: "red pepper flakes", quantity: 1, unit: "tsp" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 4,
    calories: 550,
    restrictions: ["normal"],
    instructions: "In a large skillet, heat olive oil over medium heat. Season chicken breasts with salt and pepper, then cook until golden and cooked through. Remove chicken and set aside. In the same skillet, sauté garlic and sun-dried tomatoes, then add heavy cream, chicken broth, and red pepper flakes. Bring to a simmer. Stir in Parmesan cheese and cook until the sauce thickens. Cook tortellini according to package instructions, then add to the skillet with the chicken. Stir in chopped basil, then serve hot.",
    cook_time: 25,
    image_url: "https://www.thecookingduo.com/wp-content/uploads/2023/12/Marry-Me-Chicken-Tortellini-6.jpg"
  },
  {
    name: "Chicken Apple Sausage Sheet Pan Dinner",
    ingredients_list: [
      { name: "chicken thighs", quantity: 4, unit: "" },
      { name: "apple sausages", quantity: 2, unit: "" },
      { name: "apples", quantity: 2, unit: "" },
      { name: "sweet potatoes", quantity: 2, unit: "" },
      { name: "brussels sprouts", quantity: 1, unit: "cup" },
      { name: "olive oil", quantity: 2, unit: "tbsp" },
      { name: "garlic", quantity: 4, unit: "cloves" },
      { name: "rosemary", quantity: 1, unit: "tbsp" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" },
      { name: "paprika", quantity: 1, unit: "tsp" }
    ],
    servings: 4,
    calories: 600,
    restrictions: ["normal"],
    instructions: "Preheat oven to 400°F (200°C). Toss chicken thighs, sausage, apples, sweet potatoes, and brussels sprouts with olive oil, garlic, rosemary, paprika, salt, and pepper. Arrange on a sheet pan in a single layer. Roast for 30-35 minutes, flipping halfway through, until chicken reaches 165°F and vegetables are tender. Serve hot.",
    cook_time: 35,
    image_url: "https://madaboutfood.co/wp-content/uploads/2020/11/Capture-One-Catalog0794-768x1024.jpg"
  },
  {
    name: "Buffalo Chicken Tater Tot Casserole",
    ingredients_list: [
      { name: "chicken breasts", quantity: 2, unit: "" },
      { name: "buffalo sauce", quantity: 120, unit: "g" },
      { name: "cream cheese", quantity: 8, unit: "oz" },
      { name: "ranch dressing mix", quantity: 1, unit: "packet" },
      { name: "shredded cheddar cheese", quantity: 1, unit: "cup" },
      { name: "frozen tater tots", quantity: 32, unit: "oz" },
      { name: "green onions", quantity: 15, unit: "g" }
    ],
    servings: 6,
    calories: 450,
    restrictions: ["normal"],
    instructions: "Preheat oven to 375°F (190°C). In a large bowl, mix shredded chicken, buffalo sauce, cream cheese, ranch dressing mix, and 1/2 cup of cheddar cheese. Spread tater tots in a baking dish and top with the chicken mixture. Sprinkle remaining cheddar cheese on top. Bake for 25-30 minutes, then garnish with green onions. Serve hot.",
    cook_time: 35,
    image_url: "https://thedinnerbell.recipes/wp-content/uploads/2024/09/buffalo-chicken-tater-tot-casserole-26-683x1024.jpg"
  },
  {
    name: "Easy Chicken and Broccoli Alfredo",
    ingredients_list: [
      { name: "chicken breasts", quantity: 2, unit: "" },
      { name: "broccoli florets", quantity: 2, unit: "cups" },
      { name: "fettuccine pasta", quantity: 12, unit: "oz" },
      { name: "heavy cream", quantity: 1, unit: "cup" },
      { name: "butter", quantity: 60, unit: "g" },
      { name: "garlic", quantity: 2, unit: "cloves" },
      { name: "parmesan cheese", quantity: 59, unit: "g" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 4,
    calories: 550,
    restrictions: ["normal"],
    instructions: "Cook fettuccine pasta according to package instructions, adding broccoli florets in the last 3 minutes of cooking. In a separate pan, sauté garlic in butter until fragrant. Add heavy cream and bring to a simmer. Stir in Parmesan cheese and cook until the sauce thickens. Add the cooked chicken, pasta, and broccoli to the sauce, and toss to coat. Serve hot.",
    cook_time: 30,
    image_url: "https://vikalinka.com/wp-content/uploads/2021/09/Chicken-Broccoli-Alfredo-Pasta-8-Edit.jpg"
  },
  {
    name: "Parmesan Crusted Baked Fish",
    ingredients_list: [
      { name: "white fish filets", quantity: 4, unit: "" },
      { name: "parmesan cheese", quantity: 50, unit: "g" },
      { name: "breadcrumbs", quantity: 50, unit: "g" },
      { name: "garlic powder", quantity: 1, unit: "tsp" },
      { name: "dried parsley", quantity: 1, unit: "tsp" },
      { name: "olive oil", quantity: 2, unit: "tbsp" },
      { name: "lemon", quantity: 1, unit: "" }
    ],
    servings: 4,
    calories: 300,
    restrictions: ["gluten free"],
    instructions: "Preheat oven to 400°F (200°C). Mix Parmesan cheese, breadcrumbs, garlic powder, and parsley in a shallow dish. Brush fish filets with olive oil, then coat with the Parmesan mixture. Place on a baking sheet and bake for 12-15 minutes, or until fish is cooked through. Serve with lemon slices.",
    cook_time: 20,
    image_url: "https://thelemonbowl.com/wp-content/uploads/2020/06/Lemon-Garlic-Parmesan-White-Fish-HR.jpg"
  },
  {
    name: "Tex-Mex Pork Chops and Rice Skillet", #TODO
    ingredients_list: [
      { name: "pork chops", quantity: 4, unit: "" },
      { name: "rice", quantity: 1, unit: "cup" },
      { name: "onion", quantity: 1, unit: "" },
      { name: "bell pepper", quantity: 1, unit: "" },
      { name: "canned diced tomatoes", quantity: 1, unit: "can" },
      { name: "chicken broth", quantity: 1, unit: "cup" },
      { name: "chili powder", quantity: 1, unit: "tsp" },
      { name: "cumin", quantity: 1, unit: "tsp" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 4,
    calories: 500,
    restrictions: ["normal"],
    instructions: "Season pork chops with salt, pepper, chili powder, and cumin. In a skillet, brown pork chops on both sides. Remove and set aside. In the same skillet, sauté onion and bell pepper. Add rice, canned tomatoes, chicken broth, and additional seasoning. Return pork chops to the skillet, cover, and simmer for 20-25 minutes, or until rice is tender. Serve hot.",
    cook_time: 35,
    image_url: "https://marketgrow.com/wp-content/uploads/2024/08/preview-39-696x696.webp"
  },
  {
    name: "Spicy Canned Salmon Salad Rice Bowl",
    ingredients_list: [
      { name: "canned salmon", quantity: 1, unit: "can" },
      { name: "cooked rice", quantity: 2, unit: "cups" },
      { name: "avocado", quantity: 1, unit: "" },
      { name: "cucumber", quantity: 1, unit: "" },
      { name: "soy sauce", quantity: 2, unit: "tbsp" },
      { name: "sriracha sauce", quantity: 1, unit: "tbsp" },
      { name: "mayonnaise", quantity: 2, unit: "tbsp" },
      { name: "green onions", quantity: 2, unit: "" },
      { name: "sesame seeds", quantity: 1, unit: "tsp" },
      { name: "lime", quantity: 1, unit: "" }
    ],
    servings: 2,
    calories: 400,
    restrictions: ["normal"],
    instructions: "In a bowl, mix the canned salmon with mayonnaise, soy sauce, and sriracha. Serve the rice in bowls, top with salmon mixture, diced avocado, cucumber, and green onions. Sprinkle sesame seeds on top and garnish with lime slices. Serve immediately.",
    cook_time: 10,
    image_url: "https://www.allrecipes.com/thmb/wwoULX6PkbIKFnwR-Iea2mIhuhc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/7558696_Spicy-Canned-Salmon-Salad-Rice-Bowl_Chef-Mo_4x3-6efacad1958d41d892d0b30ec8a7d3a7.jpg"
  },
  {
    name: "Grilled Tomahawk Steak",
    ingredients_list: [
      { name: "tomahawk steaks", quantity: 2, unit: "" },
      { name: "olive oil", quantity: 2, unit: "tbsp" },
      { name: "garlic", quantity: 4, unit: "cloves" },
      { name: "rosemary", quantity: 2, unit: "sprigs" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 2,
    calories: 600,
    restrictions: ["normal"],
    instructions: "Preheat grill to high. Season steaks with olive oil, garlic, rosemary, salt, and pepper. Grill steaks for 4-6 minutes per side, or until desired doneness. Let rest before serving.",
    cook_time: 15,
    image_url: "https://www.savorynothings.com/wp-content/uploads/2021/06/tomahawk-steak-image-14.jpg"
  },
  {
    name: "Chicken Bhuna",
    ingredients_list: [
      { name: "chicken breasts", quantity: 4, unit: "" },
      { name: "onion", quantity: 1, unit: "" },
      { name: "garlic", quantity: 4, unit: "cloves" },
      { name: "ginger", quantity: 1, unit: "" },
      { name: "tomatoes", quantity: 2, unit: "" },
      { name: "garam masala", quantity: 1, unit: "tsp" },
      { name: "cumin", quantity: 1, unit: "tsp" },
      { name: "coriander", quantity: 1, unit: "tsp" },
      { name: "turmeric", quantity: 1, unit: "tsp" },
      { name: "chili powder", quantity: 1, unit: "tsp" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "vegetable oil", quantity: 2, unit: "tbsp" }
    ],
    servings: 4,
    calories: 350,
    restrictions: ["normal"],
    instructions: "Heat oil in a pan, sauté onions, garlic, and ginger until softened. Add spices and tomatoes, cook until tomatoes soften. Add chicken, cook until browned. Simmer until chicken is fully cooked.",
    cook_time: 30,
    image_url: "https://tastefullyvikkie.com/wp-content/uploads/2023/02/chicken-bhuna-curry.jpg"
  },
  {
    name: "Corned Beef Roast",
    ingredients_list: [
      { name: "corned beef brisket", quantity: 3, unit: "lb" },
      { name: "garlic", quantity: 4, unit: "cloves" },
      { name: "mustard", quantity: 2, unit: "tbsp" },
      { name: "brown sugar", quantity: 2, unit: "tbsp" },
      { name: "black pepper", quantity: 1, unit: "pinch" },
      { name: "cloves", quantity: 6, unit: "" },
      { name: "water", quantity: 1, unit: "cup" }
    ],
    servings: 6,
    calories: 450,
    restrictions: ["normal"],
    instructions: "Preheat oven to 300°F (150°C). Rub brisket with garlic, mustard, brown sugar, pepper, and cloves. Place in roasting pan and cover with water. Roast for 3 hours or until tender.",
    cook_time: 180,
    image_url: "https://basilandbubbly.com/wp-content/uploads/2019/03/baked-corned-beef-featured.jpg"
  },
  {
    name: "Stout Braised Lamb Shanks",
    ingredients_list: [
      { name: "lamb shanks", quantity: 4, unit: "" },
      { name: "stout beer", quantity: 2, unit: "cups" },
      { name: "carrots", quantity: 2, unit: "" },
      { name: "celery", quantity: 2, unit: "stalks" },
      { name: "onions", quantity: 1, unit: "" },
      { name: "garlic", quantity: 4, unit: "cloves" },
      { name: "rosemary", quantity: 2, unit: "sprigs" },
      { name: "thyme", quantity: 2, unit: "sprigs" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 4,
    calories: 500,
    restrictions: ["normal"],
    instructions: "Sear lamb shanks in a hot pot, then remove and set aside. Sauté vegetables, garlic, and herbs. Add stout beer and return lamb to the pot. Cover and braise in the oven at 300°F (150°C) for 2-3 hours.",
    cook_time: 180,
    image_url: "https://whatsinthepan.com/wp-content/uploads/2018/12/Beer-Braised-Lamb-Shanks-4.jpg"
  },
  {
    name: "Chicken al Pastor",
    ingredients_list: [
      { name: "chicken breasts", quantity: 4, unit: "" },
      { name: "pineapple", quantity: 1, unit: "cup" },
      { name: "onion", quantity: 1, unit: "chopped" },
      { name: "garlic", quantity: 2, unit: "cloves" },
      { name: "chili powder", quantity: 1, unit: "tsp" },
      { name: "paprika", quantity: 1, unit: "tsp" },
      { name: "oregano", quantity: 1, unit: "tsp" },
      { name: "cumin", quantity: 1, unit: "tsp" },
      { name: "lime juice", quantity: 2, unit: "tbsp" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 4,
    calories: 400,
    restrictions: ["normal"],
    instructions: "Marinate chicken with pineapple, spices, lime juice, salt, and pepper. Cook in a skillet over medium heat until chicken is cooked through and golden brown. Serve with tortillas and extra pineapple.",
    cook_time: 20,
    image_url: "https://www.closetcooking.com/wp-content/uploads/2023/05/Chicken-al-Pastor-Tacos-1200-4402.jpg"
  },
  {
    name: "Mississippi Chicken",
    ingredients_list: [
      { name: "chicken breasts", quantity: 4, unit: "" },
      { name: "ranch dressing mix", quantity: 1, unit: "packet" },
      { name: "butter", quantity: 115, unit: "g" },
      { name: "pepperoncini peppers", quantity: 5, unit: "" },
      { name: "chicken broth", quantity: 120, unit: "g" }
    ],
    servings: 4,
    calories: 450,
    restrictions: ["normal"],
    instructions: "Place chicken breasts in a slow cooker. Sprinkle with ranch seasoning, top with butter and peppers. Pour chicken broth over. Cook on low for 6 hours until chicken is tender.",
    cook_time: 360,
    image_url: "https://wellnessbykay.com/wp-content/uploads/2023/11/plate-of-mississippi-chicken-with-potatoes.jpg"
  },
  {
    name: "Lasagna Flatbread",
    ingredients_list: [
      { name: "flatbread", quantity: 2, unit: "pieces" },
      { name: "ricotta cheese", quantity: 1, unit: "cup" },
      { name: "mozzarella cheese", quantity: 1, unit: "cup" },
      { name: "ground beef", quantity: 225, unit: "g" },
      { name: "marinara sauce", quantity: 1, unit: "cup" },
      { name: "basil", quantity: 15, unit: "g" },
      { name: "garlic", quantity: 2, unit: "cloves" }
    ],
    servings: 2,
    calories: 400,
    restrictions: ["normal"],
    instructions: "Cook ground beef with garlic. Spread marinara sauce over flatbread, top with beef, ricotta, mozzarella, and basil. Bake at 375°F (190°C) for 12-15 minutes until cheese is melted.",
    cook_time: 20,
    image_url: "https://customdistributors.com/wp-content/uploads/2021/08/Cerkl_LasagnaFlatbread-1.jpg"
  },
  {
    name: "Prosciutto Wrapped Pork Tenderloin with Crispy Sage",
    ingredients_list: [
      { name: "pork tenderloin", quantity: 1, unit: "2 lb" },
      { name: "prosciutto", quantity: 8, unit: "slices" },
      { name: "fresh sage", quantity: 8, unit: "leaves" },
      { name: "olive oil", quantity: 2, unit: "tbsp" },
      { name: "garlic", quantity: 2, unit: "cloves" },
      { name: "balsamic vinegar", quantity: 1, unit: "tbsp" }
    ],
    servings: 4,
    calories: 450,
    restrictions: ["normal"],
    instructions: "Wrap pork tenderloin with prosciutto and sage leaves. Sear in hot oil, then roast at 400°F (200°C) for 25-30 minutes. Drizzle with balsamic vinegar before serving.",
    cook_time: 40,
    image_url: "https://cb.scene7.com/is/image/Crate/cb_D_LP_20220929_christmasmaindish?wid=800&qlt=70&op_sharpen=1"
  },
  {
    name: "Beef Empanadas",
    ingredients_list: [
      { name: "ground beef", quantity: 1, unit: "lb" },
      { name: "onion", quantity: 1, unit: "" },
      { name: "garlic", quantity: 2, unit: "cloves" },
      { name: "cumin", quantity: 1, unit: "tsp" },
      { name: "chili powder", quantity: 1, unit: "tsp" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "empanada dough", quantity: 12, unit: "discs" },
      { name: "egg", quantity: 1, unit: "" }
    ],
    servings: 6,
    calories: 400,
    restrictions: ["normal"],
    instructions: "Cook ground beef with onions, garlic, spices. Place in empanada dough discs, fold and seal. Brush with egg and bake at 375°F (190°C) for 20 minutes.",
    cook_time: 30,
    image_url: "https://keviniscooking.com/wp-content/uploads/2021/08/Been-Empanadas-14.jpg"
  },
  {
    name: "Homemade Mac and Cheese",
    ingredients_list: [
      { name: "elbow macaroni", quantity: 2, unit: "cups" },
      { name: "butter", quantity: 60, unit: "g" },
      { name: "all purpose flour", quantity: 30, unit: "g" },
      { name: "milk", quantity: 2, unit: "cups" },
      { name: "cheddar cheese", quantity: 2, unit: "cups" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 4,
    calories: 500,
    restrictions: ["normal"],
    instructions: "Cook macaroni according to package instructions. In a separate pan, melt butter and whisk in flour to make a roux. Slowly add milk while whisking, then stir in cheese until melted. Combine with pasta and season with salt and pepper.",
    cook_time: 25,
    image_url: "https://www.spendwithpennies.com/wp-content/uploads/2022/12/Baked-Mac-and-Cheese-SpendWithPennies-35.jpg"
  },
  {
    name: "Slow Cooker Beef Stew",
    ingredients_list: [
      { name: "beef steak", quantity: 2, unit: "lbs" },
      { name: "carrots", quantity: 2, unit: "" },
      { name: "potatoes", quantity: 3, unit: "" },
      { name: "onion", quantity: 1, unit: "" },
      { name: "celery", quantity: 2, unit: "stalks" },
      { name: "beef broth", quantity: 4, unit: "cups" },
      { name: "garlic", quantity: 3, unit: "cloves" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" },
      { name: "bay leaves", quantity: 2, unit: "" }
    ],
    servings: 6,
    calories: 400,
    restrictions: ["normal"],
    instructions: "Place beef, vegetables, and garlic in a slow cooker. Add beef broth, salt, pepper, and bay leaves. Cook on low for 7-8 hours until meat is tender.",
    cook_time: 480,
    image_url: "https://cdn.apartmenttherapy.info/image/upload/f_jpg,q_auto:eco,c_fill,g_auto,w_1500,ar_1:1/k%2FPhoto%2FRecipes%2F2023-12-slow-cooker-beef-stew%2Fslow-cooker-beef-stew-129"
  },
  {
    name: "World's Best Lasagna",
    ingredients_list: [
      { name: "ground beef", quantity: 1, unit: "lb" },
      { name: "italian sausage", quantity: 230, unit: "g" },
      { name: "onion", quantity: 1, unit: "" },
      { name: "garlic", quantity: 4, unit: "cloves" },
      { name: "tomatoes", quantity: 1, unit: "can" },
      { name: "tomato paste", quantity: 1, unit: "can" },
      { name: "ricotta cheese", quantity: 15, unit: "oz" },
      { name: "mozzarella cheese", quantity: 16, unit: "oz" },
      { name: "parmesan cheese", quantity: 50, unit: "g" },
      { name: "eggs", quantity: 1, unit: "" },
      { name: "lasagna noodles", quantity: 12, unit: "" }
    ],
    servings: 8,
    calories: 600,
    restrictions: ["normal"],
    instructions: "Brown ground beef, sausage, and onion in a pan. Add garlic, tomatoes, tomato paste, and seasonings. Simmer for 1 hour. Layer noodles, ricotta, mozzarella, and sauce in a baking dish, repeating layers. Bake at 375°F (190°C) for 45 minutes.",
    cook_time: 90,
    image_url: "https://www.allrecipes.com/thmb/DMu07A5tc3kL8DGx7A-cDTpxFv4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/worlds-best-lasagna-vik-8963973-2000-4dfc1312250b4550a15035162f190d3a.jpeg"
  },
  {
    name: "Juicy Roasted Chicken",
    ingredients_list: [
      { name: "whole chicken", quantity: 1, unit: "" },
      { name: "olive oil", quantity: 2, unit: "tbsp" },
      { name: "garlic", quantity: 4, unit: "cloves" },
      { name: "lemon", quantity: 1, unit: "halved" },
      { name: "thyme", quantity: 2, unit: "sprigs" },
      { name: "rosemary", quantity: 2, unit: "sprigs" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 4,
    calories: 450,
    restrictions: ["normal"],
    instructions: "Preheat oven to 425°F (220°C). Rub chicken with olive oil, garlic, lemon, herbs, salt, and pepper. Roast for 1 hour 20 minutes, or until juices run clear.",
    cook_time: 80,
    image_url: "https://cafedelites.com/wp-content/uploads/2017/12/Perfect-Juicy-Roast-Chicken-IMAGE-28.jpg"
  },
  {
    name: "Chicken Pot Pie IX",
    ingredients_list: [
      { name: "chicken breasts", quantity: 2, unit: "" },
      { name: "carrots", quantity: 1, unit: "cup" },
      { name: "peas", quantity: 1, unit: "cup" },
      { name: "onion", quantity: 80, unit: "g" },
      { name: "butter", quantity: 70, unit: "g" },
      { name: "flour", quantity: 45, unit: "g" },
      { name: "chicken broth", quantity: 420, unit: "g" },
      { name: "milk", quantity: 120, unit: "g" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" },
      { name: "pie crusts", quantity: 2, unit: "" }
    ],
    servings: 6,
    calories: 500,
    restrictions: ["normal"],
    instructions: "Preheat oven to 425°F (220°C). Cook vegetables in butter, then add flour and cook for 2 minutes. Gradually add broth and milk. Stir in chicken and peas, season with salt and pepper. Pour into pie crust, top with second crust, and bake for 30 minutes.",
    cook_time: 45,
    image_url: "https://www.allrecipes.com/thmb/GD9svssJTW4fmgCxbZ94NBtxVsM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/26317-chicken-pot-pie-ix-CD_54224-4x3-74f488b88e4d4a1d848b4a85e5dda9d3.jpg"
  },
  {
    name: "Easy Meatloaf",
    ingredients_list: [
      { name: "ground beef", quantity: 680, unit: "g" },
      { name: "breadcrumbs", quantity: 60, unit: "g" },
      { name: "onion", quantity: 1, unit: "" },
      { name: "garlic", quantity: 2, unit: "cloves" },
      { name: "egg", quantity: 1, unit: "" },
      { name: "ketchup", quantity: 120, unit: "g" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 4,
    calories: 350,
    restrictions: ["normal"],
    instructions: "Preheat oven to 350°F (175°C). Mix all ingredients together in a bowl. Shape into a loaf and bake for 1 hour.",
    cook_time: 60,
    image_url: "https://www.spendwithpennies.com/wp-content/uploads/2022/12/1200-The-Best-Meatloaf-Recipe-SpendWithPennies.jpg"
  },
  {
    name: "Slow Cooker Corned Beef and Cabbage",
    ingredients_list: [
      { name: "corned beef brisket", quantity: 3, unit: "lbs" },
      { name: "cabbage", quantity: 1, unit: "head" },
      { name: "carrots", quantity: 4, unit: "" },
      { name: "onion", quantity: 1, unit: "" },
      { name: "garlic", quantity: 3, unit: "cloves" },
      { name: "chicken broth", quantity: 4, unit: "cups" },
      { name: "peppercorns", quantity: 1, unit: "tsp" },
      { name: "bay leaves", quantity: 2, unit: "" }
    ],
    servings: 6,
    calories: 350,
    restrictions: ["normal"],
    instructions: "Place corned beef in slow cooker. Add vegetables, garlic, broth, and spices. Cook on low for 8 hours.",
    cook_time: 480,
    image_url: "https://www.oliviascuisine.com/wp-content/uploads/2020/03/slow-cooker-corned-beef-and-cabbage-thumb-1024x1024.jpg"
  },
  {
    name: "Chef John's Perfect Prime Rib",
    ingredients_list: [
      { name: "prime rib", quantity: 5, unit: "lbs" },
      { name: "garlic", quantity: 4, unit: "cloves" },
      { name: "rosemary", quantity: 2, unit: "sprigs" },
      { name: "thyme", quantity: 2, unit: "sprigs" },
      { name: "olive oil", quantity: 2, unit: "tbsp" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 6,
    calories: 600,
    restrictions: ["normal"],
    instructions: "Preheat oven to 450°F (230°C). Rub prime rib with olive oil, garlic, rosemary, thyme, salt, and pepper. Roast for 15 minutes, then reduce temperature to 325°F (160°C) and roast for 1.5 hours.",
    cook_time: 105,
    image_url: "https://www.allrecipes.com/thmb/CkansB4N8EauouzG80LNMc6q_JM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/221958-chef-johns-perfect-prime-rib-DDMFS-4x3-a61d2f7572694e7cbe7dfaa623014bfc.jpg"
  },
  {
    name: "Spaghetti Aglio e Olio",
    ingredients_list: [
      { name: "spaghetti", quantity: 400, unit: "g" },
      { name: "garlic", quantity: 6, unit: "cloves" },
      { name: "red pepper flakes", quantity: 1, unit: "tsp" },
      { name: "olive oil", quantity: 60, unit: "g" },
      { name: "parsley", quantity: 15, unit: "g" },
      { name: "salt", quantity: 1, unit: "pinch" }
    ],
    servings: 4,
    calories: 450,
    restrictions: ["normal"],
    instructions: "Cook spaghetti. Sauté garlic and red pepper flakes in olive oil until golden. Toss pasta with garlic oil, parsley, and salt.",
    cook_time: 20,
    image_url: "https://www.gimmesomeoven.com/wp-content/uploads/2020/04/Spaghetti-Aglio-e-Olio-Recipe-3.jpg"
  },
  {
    name: "Salisbury Steak",
    ingredients_list: [
      { name: "ground beef", quantity: 1, unit: "lb" },
      { name: "breadcrumbs", quantity: 50, unit: "g" },
      { name: "egg", quantity: 1, unit: "" },
      { name: "onion", quantity: 1, unit: "" },
      { name: "garlic", quantity: 2, unit: "cloves" },
      { name: "beef broth", quantity: 2, unit: "cups" },
      { name: "flour", quantity: 2, unit: "tbsp" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 4,
    calories: 350,
    restrictions: ["normal"],
    instructions: "Mix ground beef, breadcrumbs, egg, onion, garlic, salt, and pepper. Shape into patties and brown in a skillet. Make gravy with beef broth and flour, then simmer patties in gravy for 10 minutes.",
    cook_time: 30,
    image_url: "https://www.allrecipes.com/thmb/VHk_YtQARbtuAZI6ZKEmnmyreG8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/8327814-5ecdf35360fc42b7bd92850001860756.jpg"
  },
  {
    name: "Oven Roasted Turkey Breast",
    ingredients_list: [
      { name: "turkey breast", quantity: 1, unit: "" },
      { name: "olive oil", quantity: 2, unit: "tbsp" },
      { name: "garlic", quantity: 3, unit: "cloves" },
      { name: "rosemary", quantity: 2, unit: "sprigs" },
      { name: "thyme", quantity: 2, unit: "sprigs" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 6,
    calories: 300,
    restrictions: ["normal"],
    instructions: "Preheat oven to 375°F (190°C). Rub turkey with olive oil, garlic, rosemary, thyme, salt, and pepper. Roast for 1.5 hours until the internal temperature reaches 165°F (75°C).",
    cook_time: 90,
    image_url: "https://www.howsweeteats.com/wp-content/uploads/2023/10/roasted-turkey-breast-10.jpg"
  },
  {
    name: "Chef John's Italian Meatballs",
    ingredients_list: [
      { name: "ground beef", quantity: 450, unit: "g" },
      { name: "ground pork", quantity: 220, unit: "g" },
      { name: "breadcrumbs", quantity: 60, unit: "g" },
      { name: "garlic", quantity: 2, unit: "cloves" },
      { name: "parmesan_cheese", quantity: 25, unit: "g" },
      { name: "egg", quantity: 1, unit: "" },
      { name: "parsley", quantity: 15, unit: "g" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" },
      { name: "marinara sauce", quantity: 2, unit: "cups" }
    ],
    servings: 6,
    calories: 400,
    restrictions: ["normal"],
    instructions: "Mix ground beef, pork, breadcrumbs, garlic, parmesan, egg, parsley, salt, and pepper. Shape into meatballs and bake at 375°F (190°C) for 20 minutes. Simmer meatballs in marinara sauce for 30 minutes.",
    cook_time: 60,
    image_url: "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg_QbPB08dva2nmqQs5UcHOcGIkYsRUJFfjPZkjyZFf8xTpRlu-rWoQvapbe-Mh4AewUexmgcztPDnYx1yGSjUs6BWCko_zXlIZW8Bp8PFqDR4rFepJcS0fuOsDx60Qc7lOtN64f4V83ulR/s1600/Chef-John%2527s-Meatless-Meatballs.jpg"
  },
  {
    name: "Pesto Pasta",
    ingredients_list: [
      { name: "pasta", quantity: 200, unit: "g" },
      { name: "pesto", quantity: 120, unit: "g" },
      { name: "parmesan cheese", quantity: 25, unit: "g" },
      { name: "garlic", quantity: 2, unit: "cloves" },
      { name: "olive oil", quantity: 1, unit: "tbsp" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 4,
    calories: 450,
    restrictions: ["normal"],
    instructions: "Cook pasta according to package instructions. Toss with pesto, garlic, olive oil, and parmesan. Season with salt and pepper.",
    cook_time: 20,
    image_url: "https://richanddelish.com/wp-content/uploads/2023/02/creamy-pesto-pasta-1.jpg"
  },
  {
    name: "Chicken Parmesan",
    ingredients_list: [
      { name: "chicken breasts", quantity: 4, unit: "" },
      { name: "breadcrumbs", quantity: 1, unit: "cup" },
      { name: "parmesan cheese", quantity: 50, unit: "g" },
      { name: "egg", quantity: 1, unit: "beaten" },
      { name: "marinara sauce", quantity: 240, unit: "g" },
      { name: "mozzarella cheese", quantity: 170, unit: "g" },
      { name: "olive oil", quantity: 2, unit: "tbsp" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 4,
    calories: 600,
    restrictions: ["normal"],
    instructions: "Preheat oven to 375°F (190°C). Bread chicken breasts and fry in olive oil until golden. Top with marinara sauce and mozzarella, then bake for 20 minutes.",
    cook_time: 30,
    image_url: "https://www.budgetbytes.com/wp-content/uploads/2024/04/Chicken-Parmesan-Overhead.jpg"
  },
  {
    name: "Quick Beef Stir-Fry",
    ingredients_list: [
      { name: "beef strips", quantity: 1, unit: "lb" },
      { name: "soy sauce", quantity: 60, unit: "g" },
      { name: "garlic", quantity: 2, unit: "cloves" },
      { name: "bell pepper", quantity: 1, unit: "sliced" },
      { name: "onion", quantity: 1, unit: "" },
      { name: "olive oil", quantity: 2, unit: "tbsp" },
      { name: "ginger", quantity: 1, unit: "tsp" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 4,
    calories: 350,
    restrictions: ["normal"],
    instructions: "Stir-fry beef in olive oil until browned. Add garlic, ginger, and vegetables. Stir in soy sauce, salt, and pepper. Cook for another 5 minutes.",
    cook_time: 15,
    image_url: "https://www.twopeasandtheirpod.com/wp-content/uploads/2020/03/Beef-Stir-Fry-6.jpg"
  },
  {
    name: "Seared Ahi Tuna Steaks",
    ingredients_list: [
      { name: "ahi tuna steaks", quantity: 2, unit: "" },
      { name: "olive oil", quantity: 1, unit: "tbsp" },
      { name: "soy sauce", quantity: 1, unit: "tbsp" },
      { name: "garlic", quantity: 1, unit: "clove" },
      { name: "black pepper", quantity: 1, unit: "pinch" },
      { name: "sesame seeds", quantity: 2, unit: "tbsp" }
    ],
    servings: 2,
    calories: 250,
    restrictions: ["gluten free"],
    instructions: "Sear the tuna in olive oil on each side, then coat with soy sauce, garlic, and sesame seeds.",
    cook_time: 10,
    image_url: "https://groomerseafood.com/wp-content/uploads/2024/07/seared-ahi-tuna-steaks.jpg"
  },
  {
    name: "Air Fryer Lobster Tails with Lemon Garlic Butter",
    ingredients_list: [
      { name: "lobster tails", quantity: 2, unit: "" },
      { name: "butter", quantity: 4, unit: "tbsp" },
      { name: "garlic", quantity: 2, unit: "cloves" },
      { name: "lemon", quantity: 1, unit: "" },
      { name: "paprika", quantity: 1, unit: "tsp" },
      { name: "parsley", quantity: 2, unit: "tbsp" }
    ],
    servings: 2,
    calories: 400,
    restrictions: ["seafood", "low carb"],
    instructions: "Air fry lobster tails with garlic butter, paprika, and lemon zest.",
    cook_time: 15,
    image_url: "https://www.allrecipes.com/thmb/QGjYdew8TgeUz3Zr_N706E0RXAo=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/AR-276006-air-fryer-lobster-tails-with-lemon-garlic-butter-DDMFS-step-09-46d6da8973b546bda7ebd6fc159b34a1.jpg"
  },
  {
    name: "Simple Chicken Mayo with Parmesan and Bread Crumbs",
    ingredients_list: [
      { name: "chicken breasts", quantity: 2, unit: "" },
      { name: "mayo", quantity: 120, unit: "g" },
      { name: "parmesan cheese", quantity: 25, unit: "g" },
      { name: "bread crumbs", quantity: 30, unit: "g" },
      { name: "garlic powder", quantity: 1, unit: "tsp" }
    ],
    servings: 2,
    calories: 500,
    restrictions: ["low carb"],
    instructions: "Coat chicken with mayo, parmesan, and bread crumbs, then bake until crispy.",
    cook_time: 25,
    image_url: "https://centslessdeals.com/wp-content/uploads/2022/07/Parmesan-Crusted-Mayonnaise-Chicken-TheShortcutKitchen-6.jpg"
  },
  {
    name: "Scrambled Eggs with Chorizo",
    ingredients_list: [
      { name: "eggs", quantity: 4, unit: "" },
      { name: "chorizo", quantity: 100, unit: "g" },
      { name: "cheddar cheese", quantity: 28, unit: "g" },
      { name: "green onions", quantity: 2, unit: "" },
      { name: "butter", quantity: 1, unit: "tbsp" }
    ],
    servings: 2,
    calories: 350,
    restrictions: ["gluten free"],
    instructions: "Scramble eggs with chorizo and top with cheddar cheese and green onions.",
    cook_time: 15,
    image_url: "https://www.allrecipes.com/thmb/OFPTIBghPiXlLlqr-grkfe_68Jc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/7219377-f1fc90583f98417cb706a1fd8ac13c8a.jpg"
  },
  {
    name: "Broiled Scallops",
    ingredients_list: [
      { name: "scallops", quantity: 1, unit: "lb" },
      { name: "butter", quantity: 4, unit: "tbsp" },
      { name: "garlic", quantity: 2, unit: "cloves" },
      { name: "lemon juice", quantity: 1, unit: "tbsp" },
      { name: "parsley", quantity: 2, unit: "tbsp" }
    ],
    servings: 2,
    calories: 250,
    restrictions: ["seafood"],
    instructions: "Broil scallops with garlic butter and lemon juice until golden and cooked through.",
    cook_time: 10,
    image_url: "https://cookingwithmammac.com/wp-content/uploads/2021/05/1200-Broiled-Scallops-with-Parmesan-Bread-Crumbs.jpg"
  },
  {
    name: "Creamy Cottage Cheese Scrambled Eggs",
    ingredients_list: [
      { name: "eggs", quantity: 4, unit: "" },
      { name: "cottage cheese", quantity: 120, unit: "g" },
      { name: "butter", quantity: 1, unit: "tbsp" },
      { name: "green onions", quantity: 2, unit: "" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 2,
    calories: 350,
    restrictions: ["gluten free"],
    instructions: "Scramble eggs with cottage cheese, butter, and green onions, and season with black pepper.",
    cook_time: 10,
    image_url: "https://wellnessbykay.com/wp-content/uploads/2024/06/scrambled-eggs-cottage-cheese-684x1024.jpg"
  },
  {
    name: "Lemon Garlic Chicken",
    ingredients_list: [
      { name: "chicken breasts", quantity: 4, unit: "" },
      { name: "lemon juice", quantity: 60, unit: "g" },
      { name: "garlic", quantity: 4, unit: "cloves" },
      { name: "olive oil", quantity: 2, unit: "tbsp" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 4,
    calories: 250,
    restrictions: ["normal"],
    instructions: "Mix lemon juice, garlic, olive oil, salt, and pepper. Marinate chicken for 30 minutes, then cook on medium heat until fully cooked.",
    cook_time: 20,
    image_url: "https://feelgoodfoodie.net/wp-content/uploads/2023/12/Lemon-Garlic-Chicken-TIMG.jpg"
  },
  {
    name: "Baked Halibut with Crispy Panko",
    ingredients_list: [
      { name: "halibut fillets", quantity: 2, unit: "" },
      { name: "panko bread crumbs", quantity: 20, unit: "g" },
      { name: "olive oil", quantity: 1, unit: "tbsp" },
      { name: "garlic", quantity: 1, unit: "clove" },
      { name: "parsley", quantity: 1, unit: "tbsp" },
      { name: "lemon juice", quantity: 1, unit: "tbsp" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 2,
    calories: 350,
    restrictions: ["normal"],
    instructions: "Preheat oven to 400°F (200°C). Mix panko with olive oil, garlic, parsley, salt, and pepper. Coat halibut fillets with mixture. Bake for 15-20 minutes.",
    cook_time: 25,
    image_url: "https://biteswithbri.com/wp-content/uploads/2024/05/BakedHalibut09.jpg"
  },
  {
    name: "Vegetarian Chickpea Sandwich Filling",
    ingredients_list: [
      { name: "chickpeas", quantity: 1, unit: "can" },
      { name: "mayonnaise", quantity: 120, unit: "g" },
      { name: "mustard", quantity: 1, unit: "tbsp" },
      { name: "celery", quantity: 1, unit: "stalk" },
      { name: "onion", quantity: 40, unit: "g" },
      { name: "parsley", quantity: 1, unit: "tbsp" },
      { name: "salt", quantity: 1, unit: "pinch" },
      { name: "black pepper", quantity: 1, unit: "pinch" }
    ],
    servings: 4,
    calories: 300,
    restrictions: ["vegetarian"],
    instructions: "Mash chickpeas and mix with mayo, mustard, celery, onion, parsley, salt, and pepper for a sandwich filling.",
    cook_time: 10,
    image_url: "https://www.bowlofdelicious.com/wp-content/uploads/2023/06/chickpea-salad-sandwich-square.jpg"
  }
]

recipes.each do |recipe|

  created_recipe = Recipe.create(
    name: recipe[:name],
    ingredients_list: recipe[:ingredients_list],
    servings: recipe[:servings],
    calories: recipe[:calories], # Include calories
    restrictions: recipe[:restrictions], # Include restriction
    instructions: recipe[:instructions],
    cook_time: recipe[:cook_time]
  )

  recipe[:ingredients_list].each do |ingredient|
    created_ingredient = Ingredient.find_or_create_by(name: ingredient[:name])
    RecipeIngredient.create(ingredient: created_ingredient, recipe: created_recipe, quantity: ingredient[:quantity], unit: ingredient[:unit])
  end


  # Attach image from URL if available
  puts recipe[:ingredients_list]

  if recipe[:image_url]
    io = URI.parse(recipe[:image_url]).open
    created_recipe.photo.attach(
      io: io,
      filename: "#{created_recipe.name.parameterize}.jpg",
      content_type: 'image/jpg'
    )
  end


  # puts "Created Recipe: #{created_recipe.name} (#{created_recipe.restrictions})"
end
