const POINTS         = 0x0000
const LINES          = 0x0001
const LINE_LOOP      = 0x0002
const LINE_STRIP     = 0x0003
const TRIANGLES      = 0x0004
const TRIANGLE_STRIP = 0x0005
const TRIANGLE_FAN   = 0x0006
const QUADS          = 0x0007

function DrawElements(mode::Integer, count::Integer, type_::Integer, ibo::Integer)
	ccall( (:glDrawElements, lib), Void,
		(GLenum, GLsizei, GLenum, Ptr{GLvoid}),
		mode, count, type_, ibo)
end

function DrawElements(mode::Integer, count::Integer, type_::Integer, indices::Ptr)
	ccall( (:glDrawElements, lib), Void,
		(GLenum, GLsizei, GLenum, Ptr{GLvoid}),
		mode, count, type_, indices)
end

DrawElements{T}(mode::Integer, indices::Array{T}) =
	DrawElements(mode, length(indices), GLtype[T], convert(Ptr{T}, indices))

   
function Color3f(r::Float16, g::Float16, b::Float16)
    ccall((:glColor3f, lib), Void, 
    (GLfloat, GLfloat, GLfloat), r,g,b)

end

function Vertex3f(x::Float16, y::Float16, z::Float16)
    ccall((:glVertex3f, lib), Void, 
    (GLfloat, GLfloat, GLfloat), x,y,z)

end

function Translatef(x::Float16, y::Float16, z::Float16)
    ccall( (:glTranslatef, lib), Void,
    (GLfloat, GLfloat, GLfloat), x,y,z)
end

function Rotatef(angle::Float16, x::Float16, y::Float16, z::Float16)
    ccall( (:glRotatef,lib), Void, 
        (GLfloat, GLfloat, GLfloat,GLfloat), angle, x,y,z)
end
