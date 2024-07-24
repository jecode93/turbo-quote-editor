# frozen_string_literal: true

class QuotesController < ApplicationController # rubocop:disable Style/Documentation
  before_action :set_quote, only: %i[edit update show destroy]

  def index
    @quotes = current_company.quotes.ordered
  end

  def show; end

  def new
    @quote = Quote.new
  end

  def create
    @quote = current_company.quotes.build(quote_params)

    if @quote.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to quotes_path, notice: 'Quote was successfully created.' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @quote.update(quotes_params)
      redirect_to quotes_path, notice: 'Quote was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to quotes_path, notice: 'Quote was successfully destroyed.' }
    end
  end

  private

  def set_quote
    @quote = current_company.quotes.find(params[:id])
  end

  def quotes_params
    params.require(:quote).permit(:name)
  end
end
