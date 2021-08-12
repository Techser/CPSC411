module Canonical.Types where

import Compiler.Types

data Program = Program [Label] [Block] Body
             deriving Show

data Block = Block Label Body
           deriving Show

data Body = Body Tail
          deriving Show

data Tail = Jump MTriv [Mloc]
          | TSeq [Stmt] Tail
          | TIf Pred Tail Tail
          deriving Show

data Stmt = Set Mloc Expr
          | MSet MTriv MTriv Expr
          | JumpRet MTriv [Mloc]
          | If Pred [Stmt] [Stmt]
          deriving Show

data Expr = Triv MTriv
          | NumOp NumOp MTriv MTriv
          | Alloc MTriv
          | MRef MTriv MTriv
          deriving Show

data Pred = Bool Bool
          | RelOp RelOp MTriv MTriv
          | Not Pred
          | PSeq [Stmt] Pred
          | PIf Pred Pred Pred
          deriving Show
