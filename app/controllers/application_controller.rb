class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  #skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  def index
  	@name = 'sandy'
  end

  def setCommentToPublication
  	puts 'setCommentToPublication'

  	Publication.create( aa: 'a', text: 'P1', comments: [ Comment.new( text: 'C1' ) ] )

  	render json: { response: 'ok' }
  end

  def addCommentToPublication
    puts 'addCommentToPublication'

    publication = Publication.create( title: 'P2' )

    Comment.create( bbb: 'C2', publication_id: publication.id )
  end

  def showPublicationAndComments
    puts Publication.all.inspect
  end

  def create
    #create users
    for i in 0..1
      user = User.create( name: ( 'u' + i.to_s ), driver: ( i % 10 == 0 ) ? true : false, age: i, priority: ( i % 10 == 0 ) ? 0 : 1 )

      for j in 0..10
        #create publications
        publication = Publication.new( title: 'p' + j.to_s, text: user.name + 'p' + j.to_s, interest_level: user.priority, user_id: user.id )
        #user.publications << publication
        #user.save

        for k in 0..5
          #create comments
          comment = Comment.new( c_title: 'c' + k.to_s, c_text: publication.text + 'c' + k.to_s, c_interest_level: user.priority, publication_id: publication.id )
          publication.comments << comment
          publication.save
        end
      end
    end
    render json: { response: 'ok' }
  end

  def createEveryThing
    #create users
    for i in 0..1
      user = User.create( name: ( 'u' + i.to_s ), driver: ( i % 10 == 0 ) ? true : false, age: i, priority: ( i % 10 == 0 ) ? 0 : 1 )
      for j in 0..10
        #create publications
        publication = Publication.create( title: 'p' + j.to_s, text: user.name + 'p' + j.to_s, interest_level: user.priority, user_id: user.id )
        #user.publications << publication
        #user.save
        for k in 0..5
          #create comments
          comment = Comment.create( title: 'c' + k.to_s, text: publication.text + 'c' + k.to_s, interest_level: user.priority, publication_id: publication.id )
          # publication.comments << comment
          # publication.save
        end
      end
    end
    render json: { response: 'ok' }
  end
end
