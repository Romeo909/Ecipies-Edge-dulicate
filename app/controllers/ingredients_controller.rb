class IngredientsController < ApplicationController

  def index
    # @path = ingredients_path
    if params[:query].present?
      @ingredients = Ingredient.search_ingredient_in_db(params[:query])
    else
      @ingredients = Ingredient.all
    end
    @user_ingredient_ids = UserIngredient.where(user: current_user).pluck(:ingredient_id)
    # these variable down here should exclude the ingredient with an id included in @user_ingredient_ids

    @categories = Category.all
    # raise
    # @vegetables = Ingredient.where(category_id: 1)
    # @fruits = Ingredient.where(category_id: 2)
    # @starch = Ingredient.where(category_id: 3)
    # @legumes = Ingredient.where(category_id: 8)
    # @flour = Ingredient.where(category_id: 4)
    # @mushrooms = Ingredient.where(category_id: 5)
    # @spices = Ingredient.where(category_id: 6)



# <% @categories.each do %>
#   <div class="card border-light mb-3" style="max-width: 18rem;">
#     <div class="card-header">Vegetables</div>
#     <div class="card-body">
#       <%# <h5 class="card-title">Light card title</h5> %>
#       <p class="card-text">
#         <% @vegetables.each do |vegetable|%>
#           <% if @user_ingredient_ids.include?(vegetable.id) %>
#           <% else %>
#             <span class="badge bg-secondary"><%= vegetable.name %>
#               <%= link_to ingredient_user_ingredients_path(vegetable), data: {turbo_method: :post} do%>
#                 <i class="fa-solid fa-circle-plus link-light"></i>
#               <% end %>
#             </span>
#           <% end %>
#         <% end %>
#       </p>
#     </div>
#   </div>
# <% end %>

#   <div class="card border-light mb-3" style="max-width: 18rem;">
#     <div class="card-header">Fruits</div>
#     <div class="card-body">
#       <p class="card-text">
#         <% @fruits.each do |fruit|%>
#           <% if @user_ingredient_ids.include?(fruit.id) %>
#           <% else %>
#             <span class="badge bg-primary"><%= fruit.name %>
#               <%= link_to ingredient_user_ingredients_path(fruit), data: {turbo_method: :post} do%>
#                 <i class="fa-solid fa-circle-plus link-light"></i>
#               <% end %>
#             </span>
#           <% end %>
#         <% end %>
#       </p>
#     </div>
#   </div>

#   <div class="card border-light mb-3" style="max-width: 18rem;">
#     <div class="card-header">Starch</div>
#     <div class="card-body">
#       <p class="card-text">
#         <% @starch.each do |starch|%>
#           <% if @user_ingredient_ids.include?(starch.id) %>
#           <% else %>
#             <span class="badge bg-primary"><%= starch.name %>
#             <%= link_to ingredient_user_ingredients_path(starch), data: {turbo_method: :post} do%>
#               <i class="fa-solid fa-circle-plus link-light"></i>
#             <% end %>
#             </span>
#           <% end %>
#         <% end %>
#       </p>
#     </div>
#   </div>

#   <div class="card border-light mb-3" style="max-width: 18rem;">
#     <div class="card-header">Legumes</div>
#     <div class="card-body">
#       <p class="card-text">
#         <% @legumes.each do |legume|%>
#           <% if @user_ingredient_ids.include?(legume.id) %>
#           <% else %>
#             <span class="badge bg-primary"><%= legume.name %>
#               <%= link_to ingredient_user_ingredients_path(legume), data: {turbo_method: :post} do%>
#                 <i class="fa-solid fa-circle-plus link-light"></i>
#               <% end %>
#             </span>
#           <% end %>
#         <% end %>
#       </p>
#     </div>
#   </div>

#   <div class="card border-light mb-3" style="max-width: 18rem;">
#     <div class="card-header">Flour</div>
#     <div class="card-body">
#       <p class="card-text">
#         <% @flour.each do |flour|%>
#           <% if @user_ingredient_ids.include?(flour.id) %>
#           <% else %>
#             <span class="badge bg-primary"><%= flour.name %>
#               <%= link_to ingredient_user_ingredients_path(flour), data: {turbo_method: :post} do%>
#                 <i class="fa-solid fa-circle-plus link-light"></i>
#               <% end %>
#             </span>
#           <% end %>
#         <% end %>
#       </p>
#     </div>
#   </div>

#   <div class="card border-light mb-3" style="max-width: 18rem;">
#     <div class="card-header">Mushrooms</div>
#     <div class="card-body">
#       <p class="card-text">
#         <% @mushrooms.each do |mushroom|%>
#           <% if @user_ingredient_ids.include?(mushroom.id) %>
#           <% else %>
#             <span class="badge bg-primary"><%= mushroom.name %>
#               <%= link_to ingredient_user_ingredients_path(mushroom), data: {turbo_method: :post} do%>
#                 <i class="fa-solid fa-circle-plus link-light"></i>
#               <% end %>
#             </span>
#           <% end %>
#         <% end %>
#       </p>
#     </div>
#   </div>

#   <div class="card border-light mb-3" style="max-width: 18rem;">
#     <div class="card-header">Spices</div>
#     <div class="card-body">
#       <p class="card-text">
#         <% @spices.each do |spice|%>
#           <% if @user_ingredient_ids.include?(spice.id) %>
#           <% else %>
#             <span class="badge bg-primary"><%= spice.name %>
#               <%= link_to ingredient_user_ingredients_path(spice), data: {turbo_method: :post} do%>
#                 <i class="fa-solid fa-circle-plus link-light"></i>
#               <% end %>
#             </span>
#           <% end %>
#         <% end %>
#       </p>
#     </div>
#   </div>

  end

end
