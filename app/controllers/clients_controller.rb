class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]

  before_action :authenticate_user!

  # GET /clients or /clients.json
  def index
    @clients = Client.all
    
    if params[:query_text].present?
      @clients = @clients.search_full_text(params[:query_text])
      @pagy, @clients = pagy(@clients.search_full_text(params[:query_text]))
    else
      @pagy, @clients = pagy(Client.all)
    end
  end

  # GET /clients/1 or /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save      
      if params[:client][:image].present?        
        uploaded_file = params[:client][:image]
        @client.image = uploaded_file
        @client.save
      end
      
        format.html { redirect_to client_url(@client), notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)      
        if params[:client][:image].present?        
          uploaded_file = params[:client][:image]
          @client.image = uploaded_file
          @client.save
        end

        format.html { redirect_to client_url(@client), notice: "Client was successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :phone, :email, :image)
    end
end
