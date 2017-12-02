(*---------------------------------------------------------------------------
   Copyright (c) 2017 Henry Till. All rights reserved.
   Distributed under the ISC license, see terms at the end of the file.
   %%NAME%% %%VERSION%%
  ---------------------------------------------------------------------------*)

module Functor : sig

  include module type of Xcat_functor_intf

  module MakeInfix : S_TO_INFIX

end

module Applicative : sig

  include module type of Xcat_applicative_intf

  module MakeFunctor : S_TO_FUNCTOR
  module MakeInfix   : S_TO_INFIX
  module MakeUtil    : S_TO_UTIL

end

module Monad : sig

  include module type of Xcat_monad_intf

  module MakeApplicative : S_TO_APPLICATIVE
  module MakeFunctor     : S_TO_FUNCTOR
  module MakeInfix       : S_TO_INFIX
  module MakeUtil        : S_TO_UTIL

end

module Foldable : sig

  include module type of Xcat_foldable_intf

end

module Traversable : sig

  include module type of Xcat_traversable_intf

end

module Semigroup : sig

  include module type of Xcat_semigroup_intf

end

module Monoid : sig

  include module type of Xcat_monoid_intf

end

module Instances : sig

  module IdentityFunctor : sig
    type 'a t = 'a
    val map : ('a -> 'b) -> 'a -> 'b
  end

  module IdentityMonad : sig
    type 'a t = 'a
    val return : 'a -> 'a
    val bind : 'a -> ('a -> 'b) -> 'b
  end

  module IdentityApplicative : sig
    type 'a t = 'a
    val map : ('a -> 'b) -> 'a -> 'b
    val pure : 'a -> 'a
    val apply : ('a -> 'b) -> 'a -> 'b
  end

  module IdentityApplicativeInfix : sig
    type 'a t = 'a
    val pure : 'a -> 'a
    val apply : ('a -> 'b) -> 'a -> 'b
    val map : ('a -> 'b) -> 'a -> 'b
    val ( <$> ) : ('a -> 'b) -> 'a -> 'b
    val ( <$ ) : 'a -> 'b -> 'a
    val ( <*> ) : ('a -> 'b) -> 'a -> 'b
    val ( *> ) : 'a -> 'b -> 'b
    val ( <* ) : 'a -> 'b -> 'a
  end

  module IdentityApplicativeUtil : sig
    type 'a t = 'a
    val map : ('a -> 'b) -> 'a -> 'b
    val pure : 'a -> 'a
    val apply : ('a -> 'b) -> 'a -> 'b
    val whennn : bool -> unit -> unit
    val unless : bool -> unit -> unit
  end

  module ListFunctor : sig
    type 'a t = 'a list
    val map : ('a -> 'b) -> 'a t -> 'b t
  end

  module ListFunctorInfix : sig
    type 'a t = 'a list
    val map : ('a -> 'b) -> 'a t -> 'b t
    val ( <$> ) : ('a -> 'b) -> 'a t -> 'b t
    val ( <$ ) : 'a -> 'b t -> 'a t
  end

  module OptionFunctor : sig
    type 'a t = 'a option
    val map : ('a -> 'b) -> 'a t -> 'b t
  end

  module OptionApplicative : sig
    type 'a t = 'a option
    val map : ('a -> 'b) -> 'a t -> 'b t
    val pure : 'a -> 'a t
    val apply : ('a -> 'b) t -> 'a t -> 'b t
  end

  module OptionMonad : sig
    type 'a t = 'a option
    val return : 'a -> 'a t
    val bind : 'a t -> ('a -> 'b t) -> 'b t
  end

  module OptionApplicativeInfix : sig
    type 'a t = 'a option
    val pure : 'a -> 'a t
    val apply : ('a -> 'b) t -> 'a t -> 'b t
    val map : ('a -> 'b) -> 'a t -> 'b t
    val ( <$> ) : ('a -> 'b) -> 'a t -> 'b t
    val ( <$ ) : 'a -> 'b t -> 'a t
    val ( <*> ) : ('a -> 'b) t -> 'a t -> 'b t
    val ( *> ) : 'a t -> 'b t -> 'b t
    val ( <* ) : 'a t -> 'b t -> 'a t
  end

end

module Util : sig

  val id : 'a -> 'a

  val const : 'a -> ('b -> 'a)

  val compose : ('b -> 'c) -> ('a -> 'b) -> 'a -> 'c

  val flip : ('a -> 'b -> 'c) -> 'b -> 'a -> 'c

end

(*---------------------------------------------------------------------------
   Copyright (c) 2017 Henry Till

   Permission to use, copy, modify, and/or distribute this software for any
   purpose with or without fee is hereby granted, provided that the above
   copyright notice and this permission notice appear in all copies.

   THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
   WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
   MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
   ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
   WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
   ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
   OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  ---------------------------------------------------------------------------*)
