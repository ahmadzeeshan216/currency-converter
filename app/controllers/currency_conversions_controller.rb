
class CurrencyConversionsController < ApplicationController
  before_action :set_currency_conversion, only: %i(new edit update)

  def create
    @currency_conversion = CurrencyConversion.new(permited_params)

    if @currency_conversion.save
      redirect_to edit_currency_conversion_path(@currency_conversion)
    else
      flash.now[:error] = @currency_conversion.errors.full_messages.flatten.to_sentence
      render :new
    end
  end

  def update
    unless @currency_conversion.update(permited_params)
      flash.now[:error] = @currency_conversion.errors.full_messages.flatten.to_sentence
    end

    render :edit
  end

  private

  def set_currency_conversion
    if params[:id].present?
      @currency_conversion = CurrencyConversion.find(params[:id])
    else
      @currency_conversion = CurrencyConversion.new
    end
  end

  def permited_params
    params.require(:currency_conversion).permit(:from, :to, :actual_amount)
  end
end
