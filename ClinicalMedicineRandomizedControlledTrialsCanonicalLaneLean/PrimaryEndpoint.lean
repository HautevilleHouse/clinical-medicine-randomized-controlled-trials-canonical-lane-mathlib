import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean

structure PrimaryEndpointDefinition where
  endpointName : String
  endpointType : String
  measurementScale : String
  clinicallyMeaningfulDifference : Float
  timePoint : Float
  statisticalTest : String

structure PrimaryEndpointEvidence (E : PrimaryEndpointDefinition) where
  meaningfulDifferencePositive : E.clinicallyMeaningfulDifference > 0
  timePointPositive : E.timePoint > 0
  statisticalTestAppropriate : E.statisticalTest ∈ ["t_test", "chi_squared", "anova", "cox"]

def PrimaryEndpointClosed (E : PrimaryEndpointDefinition) : Prop :=
  E.clinicallyMeaningfulDifference > 0 ∧ E.timePoint > 0 ∧
  (E.statisticalTest = "t_test" ∨ E.statisticalTest = "chi_squared" ∨
  E.statisticalTest = "anova" ∨ E.statisticalTest = "cox")

theorem primary_endpoint_closed_from_evidence
    (E : PrimaryEndpointDefinition) (Ev : PrimaryEndpointEvidence E) :
    PrimaryEndpointClosed E := by
  refine And.intro Ev.meaningfulDifferencePositive
    (And.intro Ev.timePointPositive
      (match Ev.statisticalTestAppropriate with
      | Or.inl h => Or.inl h
      | Or.inr (Or.inl h) => Or.inr (Or.inl h)
      | Or.inr (Or.inr (Or.inl h)) => Or.inr (Or.inr (Or.inl h))
      | Or.inr (Or.inr (Or.inr h)) => Or.inr (Or.inr (Or.inr h))))

end ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean
end HautevilleHouse
