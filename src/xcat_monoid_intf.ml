module type S = sig
  type t
  include Xcat_semigroup.S with type t := t
  val unit : t
end
