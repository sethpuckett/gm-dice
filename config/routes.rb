Rails.application.routes.draw do
  get 'dice/roll', to: 'dice_roller#roll'
end
