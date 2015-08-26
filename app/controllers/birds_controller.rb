class BirdsController < ApplicationController
  before_action :set_bird, only: [:show, :edit, :update, :destroy]

  OK = 200
  CREATED = 201
  NO_CONTENT = 204
  NOT_FOUND = 404
  BAD_REQUEST = 400
  INTERNAL_SERVER_ERROR = 500

  # GET /birds
  # GET /birds.json
  def index
    @birds = Bird.all.to_a
    begin
      respond_to do |format|
        format.json { render json: {items: @birds, description: "List all visible birds in the registry", additionalProperties: false, title: "POST /birds [request]",:status => OK } }
      end
    rescue => e
      render json: ({:status => INTERNAL_SERVER_ERROR})
    end
  end

  # GET /birds/1
  # GET /birds/1.json
  def show
    if @bird
      respond_to do |format|
        format.json { render json: {required: @bird, properties: @bird.properties, families: @bird.families, title: "POST /birds [request]", description: "Get bird by id",:status => OK }}
      end
    else
      respond_to do |format|
        format.json { render json: {:status => NOT_FOUND} }
      end
    end
  end

  # GET /birds/new
  def new
    @bird = Bird.new

    respond_to do |format|
      format.json { render json: @bird }
    end
  end

  # GET /birds/1/edit
  def edit
  end

  # POST /birds
  # POST /birds.json
  def create
    begin
    respond_to do |format|
      if @bird.save(bird_params)
        format.json { render json: {items: @birds, properties: @bird.properties, families: @bird.families, description: "Add a new bird to the library",:status => CREATED} }
      else
        format.json { render json: @bird.errors, :status => NOT_FOUND }
      end
    end
    else
        render json:({:status => INTERNAL_SERVER_ERROR})
    end
  end

  # PATCH/PUT /birds/1
  # PATCH/PUT /birds/1.json
  def update
    respond_to do |format|
      if @bird.update(bird_params)
        format.html { redirect_to @bird, notice: 'Bird was successfully updated.' }
        format.json { render :show, status: :ok, location: @bird }
      else
        format.html { render :edit }
        format.json { render json: @bird.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /birds/1
  # DELETE /birds/1.json
  def destroy
    @bird.destroy
        
    begin
      respond_to do |format|
        format.json { render json:({:status => NO_CONTENT}) }
      end
    else
      render json: ({:status => INTERNAL_SERVER_ERROR})
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bird
      @bird = Bird.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bird_params
      params.require(:bird).permit(:name, :family, :continents, :visible, :uniqueitem)
    end
end
