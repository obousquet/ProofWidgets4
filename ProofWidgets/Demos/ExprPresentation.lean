import ProofWidgets.Component.Panel.SelectionPanel
import ProofWidgets.Component.Panel.GoalTypePanel
import ProofWidgets.Component.HtmlDisplay

open ProofWidgets Jsx

@[expr_presenter]
def presenter2 : ExprPresenter where
  userName := "Latex"
  layoutKind := .inline
  present e :=
    return <span>
        {.text (← Lean.Meta.ppExpr e).pretty}
        <img src={"https://latex.codecogs.com/png.latex?" ++ (← Lean.Meta.ppExpr e).pretty} />
      </span>
  present_raw e :=
    return (← Lean.Meta.ppExpr e).pretty


example : 2 + 2 = 4 ∧ 3 + 3 = 6 := by
  with_panel_widgets [GoalTypePanel]
    -- Place cursor here.
    constructor
    rfl
    rfl

example (_h : 2 + 2 = 5) : 2 + 2 = 4 := by
  with_panel_widgets [SelectionPanel]
    -- Place cursor here and select subexpressions in the goal with shift-click.
    rfl
