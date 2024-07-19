# frozen_string_literal: true

class QuotesController < ApplicationController # rubocop:disable Style/Documentation
  before_action :set_quotes, only: %i[edit update show destroy]

  def index
    @quotes = Quote.all
  end

  def show; end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quotes_params)

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

  def set_quotes
    @quote = Quote.find(params[:id])
  end

  def quotes_params
    params.require(:quote).permit(:name)
  end
end
