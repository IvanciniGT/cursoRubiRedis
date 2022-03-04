require "resque/server"

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'comer/:comida' => 'comer#comida'
  # http://servidor:puerto/beber/martini
  #    beber/martini
  #             V (parametro)
  get 'beber/:bebida' => 'beber#bebida'
                        # beber: Controlador: "Beber"Controller
                        # bebida: Función dentro del controlador

  mount Resque::Server.new, at: "/jobs"

end
