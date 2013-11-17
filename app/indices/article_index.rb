ThinkingSphinx::Index.define :article, with: :active_record do
  indexes headline
  has created_at
end
