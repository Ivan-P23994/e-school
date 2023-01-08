class InvoicesController < ApplicationController
  # frozen_string_literal: true
  before_action :set_invoice, only: %i[show edit update destroy]

  def index
    @invoices = Invoice.all
  end

  def show; end

  def new
    @invoice = Invoice.new
  end

  def edit; end

  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      respond_to do |format|
        format.html { redirect_to invoices_path, notice: 'Invoice was successfully created.' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html do
          redirect_to invoice_url(@invoice), notice: 'Invoice was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @invoice.destroy
    redirect_to invoices_path
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:id, :title, :invoice_no, :user_id, :amount, :paid_amount, :status)
  end
end
