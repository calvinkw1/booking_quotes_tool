Rails.application.routes.draw do

  get '/', to: "inquiries#index", as: "root"

  resources :inquiries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


#       Prefix Verb   URI Pattern                   Controller#Action
#         root GET    /                             inquiries#index
#    inquiries GET    /inquiries(.:format)          inquiries#index
#              POST   /inquiries(.:format)          inquiries#create
#  new_inquiry GET    /inquiries/new(.:format)      inquiries#new
# edit_inquiry GET    /inquiries/:id/edit(.:format) inquiries#edit
#      inquiry GET    /inquiries/:id(.:format)      inquiries#show
#              PATCH  /inquiries/:id(.:format)      inquiries#update
#              PUT    /inquiries/:id(.:format)      inquiries#update
#              DELETE /inquiries/:id(.:format)      inquiries#destroy