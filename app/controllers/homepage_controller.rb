class HomepageController < Spree::BaseController
  helper :products

  def show
    if params[:page]
      redirect_to(products_path(:page => params[:page]))
    end
  end

end