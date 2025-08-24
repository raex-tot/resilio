import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import OpenAI from 'openai';

admin.initializeApp();
const openai = new OpenAI();

export const recommendSkills = functions.https.onCall(async (data, context) => {
  const uid = context.auth?.uid;
  if (!uid) throw new functions.https.HttpsError('unauthenticated', 'Login required');
  // TODO: fetch signals and build prompt
  try {
    const response = await openai.chat.completions.create({
      model: 'gpt-4o-mini',
      messages: [
        { role: 'system', content: 'You recommend DBT skills succinctly.' },
        { role: 'user', content: 'placeholder prompt' }
      ],
      temperature: 0.2,
    });
    const content = response.choices[0]?.message?.content ?? '';
    if (!content) {
      throw new Error('Empty model response');
    }
    return { recommendations: content };
  } catch (error: any) {
    throw new functions.https.HttpsError('internal', error?.message ?? 'Failed to generate recommendations');
  }
});

export const generateWeeklyReport = functions.https.onCall(async (data, context) => {
  // TODO: summarise data and store in reports collection
  return { ok: true };
});

export const createTherapistClientLink = functions.https.onCall(async (data, context) => {
  // TODO: check consent and create document
  return { ok: true };
});

export const exportPdf = functions.https.onCall(async (data, context) => {
  // TODO: generate PDF and store in Storage
  return { ok: true };
});
