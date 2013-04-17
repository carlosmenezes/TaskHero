TaskHero.controllers :login do
	
	get :login, :map => '/login' do
		render 'login/login'
	end

	post :login, :map => '/login' do
		'OK'
	end	

end