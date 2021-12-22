local ok, comment = pcall(require, 'comment')
if not ok then
	return
end

comment.setup()
