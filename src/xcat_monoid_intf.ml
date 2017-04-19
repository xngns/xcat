module type S = sig
  include Xcat_semigroup.S
  val unit : t
end
