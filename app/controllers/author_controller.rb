class AuthorController < ApplicationController
    skip_before_action :verify_authenticity_token
    # skip_before_action :require_login, only:[:new, :create,:show]
    before_action :authorize_request, except: [:create, :show, :index]
    def index
        render json: Author.all
    end
    def show
        author=Author.find_by(email: params[:email])
        if(author!=nil)
        render json: author  
        else
        render html: 'Author nor found'
        end
    end
    def new
    end
    def create
        author=Author.new(name: params[:name],decription: params[:decription],email: params[:email],password: params[:password])
        const=author.save;
        if(const==false)
        render html: 'problem in credentials'
        else
        render json:  author
        end       
    end
    def edit
        author=Author.find_by(email: params[:email])
        # to write a same author condition
        if(author!=nil&&author.authenticate(params[:oldpass])!=false)
        if(author.update(params.require(:author).permit(:name, :description, :email,:newpass)))
        render html: 'perfectly edited'
        else
        render json: { errors: author.errors.full_messages },
        status: :unprocessable_entity
        end
        else
          render json: author.authenticate(params[:oldpass])
        end  
    end
    def delete
        author=Author.find_by(params[:id])
        if(author!=nil)
        author.destroy
        else
        render html: 'Kya bakchodi hai yar'  
        end  
        # headers = request.headers['Authorization'].split(' ').last
        # session = Session.find_by(token: JsonWebToken.decode(headers)[:token])
        # session.close
    end
    def userarticle
       author=Author.find_by(id: params[:id]);
       if(author==nil)
        render json: "User not found"
        else
         render json: author.articles
        end     
    end
    # def showallarticle
    # end
end
